using Elight.Entity.Model;
using Elight.Entity.Sys;
using Elight.Logic.Base;
using Elight.Utility.Log;
using Elight.Utility.Model;
using Elight.Utility.Operator;
using Newtonsoft.Json;
using SqlSugar;
using SyntacticSugar;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Elight.Logic.Sys
{
    public class SysRebateLogic : BaseLogic
    {
        /// <summary>
        /// 主播返点集合
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public List<SysRebateEntity> GetRebateListPage(PageParm parm, ref int totalCount)
        {
            var result = new List<SysRebateEntity>();
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
                    return db.Queryable<SysRebateEntity, SysUser>((gt, it) => new object[] { JoinType.Left, gt.UserID == it.Id })
                             .Where((gt, it) => gt.ShopID == OperatorProvider.Instance.Current.ShopID)
                             .WhereIF(dic.ContainsKey("Name") && !string.IsNullOrEmpty(dic["Name"].ToString()), (gt, it) => it.Account.Contains(dic["Name"].ToString()) || it.RealName.Contains(dic["Name"].ToString()))
                             .Select((gt, it) => new SysRebateEntity
                             {
                                 id = gt.id,
                                 TipRebate = gt.TipRebate,
                                 HourRebate = gt.HourRebate,
                                 ModifiedBy = gt.ModifiedBy,
                                 ModifiedTime = gt.ModifiedTime,
                                 CreateTime = gt.CreateTime,
                                 UserAccount = it.Account
                             })
                             .ToPageList(parm.page, parm.limit, ref totalCount);
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "主播返点集合 分页信息", ex.Message, ex.StackTrace);
            }
            return result;
        }
    }
}
