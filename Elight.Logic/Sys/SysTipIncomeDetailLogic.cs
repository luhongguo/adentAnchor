using Elight.Entity.Enum;
using Elight.Entity.Model;
using Elight.Entity.Sys;
using Elight.Logic.Base;
using Elight.Utility.Log;
using Elight.Utility.Model;
using Elight.Utility.Operator;
using Newtonsoft.Json;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Logic.Sys
{
    public class SysTipIncomeDetailLogic : BaseLogic
    {
        /// <summary>
        /// 礼物返点信息 分页信息
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public List<TipIncomeDetailModel> GetTipIncomeDetailPage(PageParm parm, ref int totalCount, ref TipIncomeDetailModel sumModel)
        {
            var res = new List<TipIncomeDetailModel>();
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
                using (var db = GetSqlSugarDB(DbConnType.QPAnchorRecordDB))
                {
                    var query = db.Queryable<SysShopAnchorEntity, SysTipIncomeDetailEntity, SysUser, SysAnchor, TipEntity>((et, at, bt, ct, dt) => new object[] {
                                JoinType.Left,et.AnchorID==at.AnchorID,
                                JoinType.Left,at.UserID==bt.Id,
                                JoinType.Left,at.AnchorID==ct.id,
                                JoinType.Left,at.orderno==dt.orderno
                      })
                          .Where((et, at, bt, ct, dt) => et.ShopID == OperatorProvider.Instance.Current.ShopID)
                          .Where((et, at, bt, ct, dt) => at.StartDate >= Convert.ToDateTime(dic["startTime"]) && at.StartDate < Convert.ToDateTime(dic["endTime"]).AddDays(1))
                          .WhereIF(dic.ContainsKey("AgentName") && !string.IsNullOrEmpty(dic["AgentName"].ToString()), (et, at, bt, ct, dt) => bt.Account.Contains(dic["AgentName"].ToString()))
                          .WhereIF(dic.ContainsKey("AnchorName") && !string.IsNullOrEmpty(dic["AnchorName"].ToString()), (et, at, bt, ct, dt) => ct.anchorName.Contains(dic["AnchorName"].ToString()) || ct.nickName.Contains(dic["AnchorName"].ToString()))
                          .WhereIF(dic.ContainsKey("Type") && Convert.ToInt32(dic["Type"].ToString()) != -1, (et, at, bt, ct, dt) => at.TipType == (TipTypeEnum)Convert.ToInt32(dic["Type"].ToString()))
                          .WhereIF(dic.ContainsKey("incomeType") && Convert.ToInt32(dic["incomeType"].ToString()) != -1, (et, at, bt, ct, dt) => at.IncomeType == (IncomeTypeEnum)Convert.ToInt32(dic["incomeType"].ToString()));
                    sumModel = query.Clone().Select((et, at, bt, ct, dt) => new TipIncomeDetailModel
                    {
                        AnchorIncome = SqlFunc.AggregateSum(at.AnchorIncome),
                        UserIncome = SqlFunc.AggregateSum(at.UserIncome),
                        PlatformIncome = SqlFunc.AggregateSum(at.PlatformIncome),
                        totalamount = SqlFunc.AggregateSum(dt.totalamount)
                    }).WithCache(60).First();
                    res = query
                         .Select((et, at, bt, ct, dt) => new TipIncomeDetailModel
                         {
                             UserName = bt.Account,
                             AnchorName = ct.anchorName,
                             AnchorNickName = ct.nickName,
                             UserIncome = at.UserIncome,
                             AnchorIncome = at.AnchorIncome,
                             PlatformIncome = at.PlatformIncome,
                             UserRebate = at.UserRebate,
                             PlatformRebate = at.PlatformRebate,
                             orderno = dt.orderno,
                             totalamount = dt.totalamount,
                             CreateTime = at.CreateTime,
                             Type = at.TipType,
                             incomeType = at.IncomeType,
                         })
                         .OrderBy(" dt.sendtime desc")
                         .WithCache(60)
                        .ToPageList(parm.page, parm.limit, ref totalCount);
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "礼物返点信息 分页信息", ex.Message, ex.StackTrace);
            }
            return res;
        }
    }
}
