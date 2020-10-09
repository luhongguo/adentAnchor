﻿using Elight.Entity.Sys;
using Elight.Logic.Base;
using Elight.Utility.Log;
using Elight.Utility.Model;
using Elight.Utility.Operator;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using SqlSugar;
using System.Linq;
using Elight.Entity;

namespace Elight.Logic.Sys
{
    public class SysAnchorWithdrawalRecordLogic : BaseLogic
    {
        /// <summary>
        /// 获取主播提现记录
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public List<SysAnchorWithdrawalRecordEntity> GetAgentWithdrawalRecordPage(PageParm parm, ref int totalCount)
        {
            var result = new List<SysAnchorWithdrawalRecordEntity>();
            try
            {
                if (parm == null)
                {
                    parm = new PageParm();
                }
                Dictionary<string, object> dic = new Dictionary<string, object>();
                if (!string.IsNullOrEmpty(parm.where))
                {
                    dic = JsonConvert.DeserializeObject<Dictionary<string, object>>(parm.where);
                }
                using (var db = GetSqlSugarDB(DbConnType.QPAgentAnchorDB))
                {
                    return db.Queryable<SysShopAnchorEntity, SysAnchorWithdrawalRecordEntity, SysAnchor, SysAnchorBankEntity>((bt, it, st, at) => new object[] { JoinType.Left, bt.AnchorID == it.AnchorID, JoinType.Left, it.AnchorID == st.id, JoinType.Left, it.AgentBankID == at.id })
                        .Where((bt, it, st, at) => bt.ShopID == OperatorProvider.Instance.Current.ShopID)
                        .Where((bt, it, st, at) => it.createTime >= Convert.ToDateTime(dic["startTime"]) && it.createTime < Convert.ToDateTime(dic["endTime"]))
                        .WhereIF(dic.ContainsKey("Name") && !string.IsNullOrEmpty(dic["Name"].ToString()), (bt, it, st, at) => st.anchorName.Contains(dic["Name"].ToString()) || st.nickName.Contains(dic["Name"].ToString()))
                         .WhereIF(dic.ContainsKey("Status") && Convert.ToInt32(dic["Status"]) != -1, (bt, it, st, at) => it.Status == Convert.ToInt32(dic["Status"]))
                        .Select((bt, it, st, at) => new SysAnchorWithdrawalRecordEntity
                        {
                            id = it.id,
                            AgentName = st.anchorName,
                            NickName = st.nickName,
                            WithdrawalAmount = it.WithdrawalAmount,
                            CategoryCode = at.CategoryCode,
                            bankano = at.bankano,
                            bankaccount = at.bankaccount,
                            address = at.address,
                            Remark = it.Remark,
                            payType = at.payType,
                            Type = it.Type,
                            Feedback = it.Feedback,
                            Status = it.Status,
                            createTime = it.createTime,
                            ModifiedTime = it.ModifiedTime,
                            ModifiedBy = it.ModifiedBy
                        })
                         .ToPageList(parm.page, parm.limit, ref totalCount);
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "获取主播提现记录", ex.Message, ex.StackTrace);
            }
            return result;
        }
        /// <summary>
        /// 新增主播提现记录
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Insert(SysAnchorWithdrawalRecordEntity model)
        {
            try
            {
                using (var db = GetInstance())
                {
                    model.Status = 3;
                    model.createTime = DateTime.Now;
                    model.ModifiedTime = DateTime.Now;
                    model.Remark = model.Remark.Trim();
                    return db.Insertable(model).ExecuteReturnIdentity();
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "新增主播提现记录", ex.Message, ex.StackTrace);
            }
            return 0;
        }
        /// <summary>
        /// 根据主键得到提现记录信息
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public SysAnchorWithdrawalRecordEntity Get(long primaryKey)
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysAnchorWithdrawalRecordEntity>()
                    .Where((A) => A.id == primaryKey)
                    .Select((A) => new SysAnchorWithdrawalRecordEntity
                    {
                        id = A.id,
                        AnchorID = A.AnchorID,
                        Status = A.Status,
                        Feedback = A.Feedback,
                        WithdrawalAmount = A.WithdrawalAmount
                    })
                    .First();
            }
        }
        /// <summary>
        /// 处理主播提现成功
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Update(SysAnchorWithdrawalRecordEntity model, SysAnchorInfoEntity agentModel)
        {
            int result = 0;
            using (var db = GetInstance())
            {
                try
                {
                    db.Ado.BeginTran();//开启事务
                    result = db.Updateable<SysAnchorWithdrawalRecordEntity>().SetColumns(it => new SysAnchorWithdrawalRecordEntity
                    {
                        Status = model.Status,
                        Feedback = model.Feedback,
                        WithdrawalAmount = model.WithdrawalAmount,
                        ModifiedBy = OperatorProvider.Instance.Current.Account,
                        ModifiedTime = DateTime.Now
                    }).Where(it => it.id == model.id).ExecuteCommand();
                    //更新主播余额
                    db.Updateable<SysAnchorInfoEntity>().SetColumns(it => new SysAnchorInfoEntity { gold = agentModel.gold - model.WithdrawalAmount }).Where(it => it.aid == agentModel.aid).ExecuteCommand();
                    db.Ado.CommitTran();
                }
                catch (Exception ex)
                {
                    db.Ado.RollbackTran();
                    new LogLogic().Write(Level.Error, "处理主播提现成功", ex.Message, ex.StackTrace);
                }
                return result;
            }
        }
        /// <summary>
        /// 处理主播提现驳回
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Reject(SysAnchorWithdrawalRecordEntity model)
        {
            var result = 0;
            using (var db = GetInstance())
            {
                try
                {
                    model.Feedback = model.Feedback.Trim();
                    result = db.Updateable(model).UpdateColumns(it => new
                    {
                        model.Status,
                        model.Feedback,
                        model.WithdrawalAmount,
                        ModifiedBy = OperatorProvider.Instance.Current.Account,
                        ModifiedTime = DateTime.Now
                    }).ExecuteCommand();
                }
                catch (Exception ex)
                {
                    new LogLogic().Write(Level.Error, "处理主播提现驳回", ex.Message, ex.StackTrace);
                }
                return result;
            }
        }
    }
}
