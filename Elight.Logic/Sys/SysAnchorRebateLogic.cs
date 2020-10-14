﻿using Elight.Entity;
using Elight.Entity.Model;
using Elight.Entity.Sys;
using Elight.Logic.Base;
using Elight.Utility.Log;
using Elight.Utility.Model;
using Elight.Utility.Operator;
using Elight.Utility.ResponseModels;
using Newtonsoft.Json;
using SqlSugar;
using SyntacticSugar;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Elight.Logic.Sys
{
    public class SysAnchorRebateLogic : BaseLogic
    {
        /// <summary>
        /// 主播返点分页信息
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public List<SysAnchorRebateEntity> GetAnchorRebatePage(PageParm parm, ref int totalCount)
        {
            var result = new List<SysAnchorRebateEntity>();
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
                    return db.Queryable<SysShopAnchorEntity, SysAnchorRebateEntity, SysAnchor, SysUser>((bt, gt, it, at) => new object[] {
                        JoinType.Left,bt.AnchorID==gt.AnchorID,
                        JoinType.Left, gt.AnchorID == it.id,
                       JoinType.Left,gt.parentID==at.Id
                     })
                               .Where((bt, gt, it, at) => bt.ShopID == OperatorProvider.Instance.Current.ShopID && !SqlFunc.IsNullOrEmpty(gt.id))
                               .WhereIF(dic.ContainsKey("Name") && !string.IsNullOrEmpty(dic["Name"].ToString()), (bt, gt, it, at) => it.anchorName.Contains(dic["Name"].ToString()) || it.nickName.Contains(dic["Name"].ToString()))
                               .Select((bt, gt, it, at) => new SysAnchorRebateEntity
                               {
                                   id = gt.id,
                                   TipRebate = gt.TipRebate,
                                   HourRebate = gt.HourRebate,
                                   ModifiedBy = gt.ModifiedBy,
                                   ModifiedTime = gt.ModifiedTime,
                                   CreateTime = gt.CreateTime,
                                   AnchorName = it.anchorName,
                                   AnchorNickName = it.nickName,
                                   UserAccount = at.Account
                               })
                               .ToPageList(parm.page, parm.limit, ref totalCount);
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "主播返点分页信息", ex.Message, ex.StackTrace);
            }
            return result;
        }
        /// <summary>
        /// 根据主键得到用户返点信息
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public SysAnchorRebateEntity Get(int primaryKey)
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysAnchorRebateEntity, SysAnchor, SysUser>((A, B, C) => new object[] { JoinType.Left, A.AnchorID == B.id, JoinType.Left, A.parentID == C.Id })
                    .Where((A, B) => A.id == primaryKey)
                    .Select((A, B, C) => new SysAnchorRebateEntity
                    {
                        id = A.id,
                        AnchorName = B.anchorName,
                        AnchorNickName = B.nickName,
                        TipRebate = A.TipRebate,
                        HourRebate = A.HourRebate,
                        UserAccount = C.Account
                    }).First();
            }
        }
        /// <summary>
        /// 新增主播返点
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Insert(SysAnchorRebateEntity model)
        {
            try
            {
                using (var db = GetInstance())
                {
                    model.CreateTime = DateTime.Now;
                    model.ModifiedBy = OperatorProvider.Instance.Current.Account;
                    model.ModifiedTime = model.CreateTime;
                    return db.Insertable(model).ExecuteReturnIdentity();
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "新增主播返点", ex.Message, ex.StackTrace);
            }
            return 0;
        }
        /// <summary>
        /// 更新返点
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Update(SysAnchorRebateEntity model)
        {
            try
            {
                using (var db = GetInstance())
                {
                    model.ModifiedBy = OperatorProvider.Instance.Current.Account;
                    model.ModifiedTime = DateTime.Now;
                    return db.Updateable(model).UpdateColumns(it => new
                    {
                        it.TipRebate,
                        it.HourRebate
                    }).ExecuteCommand();
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "修改商户", ex.Message, ex.StackTrace);
            }
            return 0;
        }
        /// <summary>
        /// 验证主播返点是否存在
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        public SysAnchorRebateEntity GetRebateByAccount(int anchorID)
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysAnchorRebateEntity>().Where(it => it.AnchorID == anchorID).First();
            }
        }
        /// <summary>
        /// 验证该商户下是否存在该主播
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        public SysAnchor CheckAnchor(string username)
        {
            using (var db = GetSqlSugarDB(DbConnType.QPVideoAnchorDB))
            {
                return db.Queryable<SysShopAnchorEntity, SysAnchor>((it, st) => new object[] { JoinType.Left, it.AnchorID == st.id })
                       .Where(it => it.ShopID == OperatorProvider.Instance.Current.ShopID)
                       .Where((it, st) => st.anchorName == username)
                       .Select((it, st) => st)
                       .First();
            }
        }
        /// <summary>
        /// 批量删除返点信息
        /// </summary>
        /// <param name="primaryKeys"></param>
        /// <returns></returns>
        public int Delete(List<int> idList)
        {
            using (var db = GetInstance())
            {
                return db.Deleteable<SysAnchorRebateEntity>().In(idList).ExecuteCommand();
            }
        }
    }
}
