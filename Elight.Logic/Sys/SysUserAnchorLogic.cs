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
    public class SysUserAnchorLogic : BaseLogic
    {
        /// <summary>
        /// 主播信息分页
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <param name="totalCount"></param>
        /// <returns></returns>
        public List<SysAnchor> UserSelectAnchorList(PageParm parm, ref int totalCount)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            if (!string.IsNullOrEmpty(parm.where))
            {
                dic = JsonConvert.DeserializeObject<Dictionary<string, object>>(parm.where);
            }
            var result = new List<SysAnchor>();
            try
            {
                //lmstatus  连麦状态 live 直播 offline 离线  normal正常 kickline踢线  disabled禁用
                //statu 	正常unlock 禁用 lock 审核中 audit
                using (var db = GetInstance())
                {
                    result = db.Queryable<SysShopAnchorEntity, SysAnchor, SysAnchorInfoEntity>((st, it, at) => new object[] { JoinType.Left, st.AnchorID == it.id, JoinType.Left, it.id == at.aid })
                                .Where((st, it) => st.ShopID == OperatorProvider.Instance.Current.ShopID)
                                .WhereIF(dic.ContainsKey("Name") && !string.IsNullOrEmpty(dic["Name"].ToString()), (st, it, at) => it.anchorName.Contains(dic["Name"].ToString()) || it.nickName.Contains(dic["Name"].ToString()))
                                .WhereIF(dic.ContainsKey("startTime") && !string.IsNullOrEmpty(dic["startTime"].ToString()) && !string.IsNullOrEmpty(dic["endTime"].ToString()), (st, it, at) => it.createTime >= Convert.ToDateTime(dic["startTime"]) && it.createTime < Convert.ToDateTime(dic["endTime"]))
                                .Select((st, it, at) => new SysAnchor
                                {
                                    id = it.id,
                                    anchorName = it.anchorName,
                                    nickName = it.nickName,
                                    headUrl = SqlFunc.IIF(it.headUrl.Contains("http"), it.headUrl, Image_CDN + it.headUrl),
                                    balance = at.gold,
                                    follow = at.follow,
                                    birthday = it.birthday,
                                    status = at.status,
                                    createTime = it.createTime
                                }).ToPageList(parm.page, parm.limit, ref totalCount);
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "经纪人查看主播信息", ex.Message, ex.StackTrace);
            }
            return result;
        }
        /// <summary>
        /// 超管获得经纪人拥有的主播 列表分页
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <param name="totalCount"></param>
        /// <returns></returns>
        public List<SysAnchor> GetUserAnchorList(int pageIndex, int pageSize, string keyWord, ref int totalCount)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            if (!string.IsNullOrEmpty(keyWord))
            {
                dic = JsonConvert.DeserializeObject<Dictionary<string, object>>(keyWord);
            }
            var result = new List<SysAnchor>();
            try
            {
                //lmstatus  连麦状态 live 直播 offline 离线 disabled禁用 normal正常 kickline踢线
                //statu 	正常unlock 禁用 lock 审核中 audit
                using (var db = GetInstance())
                {
                    //result = db.Queryable<SysUserAnchor, SysAnchor>((st, it) => new object[] { JoinType.Left, st.AnchorID == it.id })
                    //             .WhereIF(dic.ContainsKey("anchorUserName") && !string.IsNullOrEmpty(dic["anchorUserName"].ToString()), (st, it) => it.username.Contains(dic["anchorUserName"].ToString()) || it.nickname.Contains(dic["anchorUserName"].ToString()))
                    //             .WhereIF(dic.ContainsKey("userID") && !string.IsNullOrEmpty(dic["userID"].ToString()), (st, it) => st.UserID == dic["userID"].ToString())
                    //             .Select((st, it) => new SysAnchor
                    //             {
                    //                 id = it.id,
                    //                 username = it.username,
                    //                 nickname = it.nickname,
                    //                 photo = it.photo,
                    //                 balance = it.balance,
                    //                 atteCount = it.atteCount,
                    //                 ishot = it.ishot,
                    //                 isrecommend = it.isrecommend,
                    //                 regtime = it.regtime,
                    //                 viplevel = it.viplevel,
                    //                 birthday = it.birthday,
                    //             }).ToPageList(pageIndex, pageSize, ref totalCount);
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "获得经纪人主播列表分页", ex.Message, ex.StackTrace);
            }
            return result;
        }
        /// <summary>
        /// 经纪人不拥有的主播 数据分页
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord">查询条件</param>
        /// <param name="totalCount">数据总数</param>
        /// <returns></returns>
        public List<SysAnchor> GetUserNoOwnedAnchorList(int pageIndex, int pageSize, string keyWord, ref int totalCount)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            if (!string.IsNullOrEmpty(keyWord))
            {
                dic = JsonConvert.DeserializeObject<Dictionary<string, object>>(keyWord);
            }
            var result = new List<SysAnchor>();
            try
            {
                //lmstatus  连麦状态 live 直播 offline 离线 disabled禁用 normal正常 kickline踢线
                //statu 	正常unlock 禁用 lock 审核中 audit
                using (var db = GetSqlSugarDB(DbConnType.QPVideoAnchorDB))
                {
                    //result = db.Queryable<SysShopAnchorEntity, SysAnchor>((st, it) => new object[] { JoinType.Left, st.AnchorID == it.id })
                    //             .Where((st, it) => st.ShopID == OperatorProvider.Instance.Current.ShopID)
                    //             .Where((st, it) => SqlFunc.Subqueryable<SysUserAnchor>().Where(gt => gt.UserID == dic["userID"].ToString()).Where(gt => gt.AnchorID == st.AnchorID).NotAny())
                    //             .WhereIF(dic.ContainsKey("anchorUserName") && !string.IsNullOrEmpty(dic["anchorUserName"].ToString()), (st, it) => it.username.Contains(dic["anchorUserName"].ToString()) || it.nickname.Contains(dic["anchorUserName"].ToString()))
                    //             .Select((st, it) => new SysAnchor
                    //             {
                    //                 id = it.id,
                    //                 username = it.username,
                    //                 nickname = it.nickname,
                    //                 photo = it.photo,
                    //                 balance = it.balance,
                    //                 atteCount = it.atteCount,
                    //                 ishot = it.ishot,
                    //                 isrecommend = it.isrecommend,
                    //                 regtime = it.regtime,
                    //                 viplevel = it.viplevel,
                    //                 birthday = it.birthday,
                    //             }).ToPageList(pageIndex, pageSize, ref totalCount);
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "经纪人不拥有的主播 数据分页", ex.Message, ex.StackTrace);
            }
            return result;
        }
        /// <summary>
        /// 添加主播给经纪人
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="idList">主播ID集合</param>
        /// <param name="userID">用户ID</param>
        /// <returns></returns>
        public bool AddUserAnchor(string[] idList, string userID)
        {
            var result = true;
            try
            {
                using (var db = GetInstance())
                {
                    List<SysUserAnchor> list = new List<SysUserAnchor>();
                    foreach (var item in idList)
                    {
                        list.Add(new SysUserAnchor { id = Guid.NewGuid().ToString().Replace("-", ""), UserID = userID, AnchorID = Convert.ToInt32(item) });
                    }
                    var count = db.Insertable(list.ToArray()).ExecuteCommand();
                    result = count == idList.Count() ? true : false;
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "添加主播给经纪人", ex.Message, ex.StackTrace);
                result = false;
            }
            return result;
        }
        /// <summary>
        /// 删除经纪人主播
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="idList">主播ID集合</param>
        /// <param name="userID">用户ID</param>
        /// <returns></returns>
        public bool Delete(string[] idList, string userID)
        {
            var result = true;
            try
            {
                using (var db = GetInstance())
                {
                    var count = db.Deleteable<SysUserAnchor>().Where(it => it.UserID == userID).In(it => it.AnchorID, idList).ExecuteCommand();
                    result = count == idList.Count() ? true : false;
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "删除经纪人主播", ex.Message, ex.StackTrace);
                result = false;
            }
            return result;
        }

       
        /// <summary>
        /// 主播财务报表分页信息
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public List<IncomeTemplateModel> GetAnchorReportPage(PageParm parm, ref int totalCount, ref IncomeTemplateModel sumModel)
        {
            var res = new List<IncomeTemplateModel>();
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
                    var query = db.Queryable<SysShopAnchorEntity, SysAnchor, SysAnchorInfoEntity, SysIncomeEntity>((at, st, bt, it) => new object[] {
                        JoinType.Left,at.AnchorID==st.id,
                        JoinType.Left,st.id==bt.aid,
                        JoinType.Left, st.id == it.AnchorID })
                        .Where((at, st, bt, it) => at.ShopID == OperatorProvider.Instance.Current.ShopID)
                        .Where((at, st, bt, it) => it.opdate >= Convert.ToDateTime(dic["startTime"]) && it.opdate < Convert.ToDateTime(dic["endTime"]))
                        .WhereIF(dic.ContainsKey("Name") && !string.IsNullOrEmpty(dic["Name"].ToString()), (at, st, it) => st.anchorName.Contains(dic["Name"].ToString()) || st.nickName.Contains(dic["Name"].ToString()))
                        .WithCache(60);
                    sumModel = query.Clone().Select((at, st, bt, it) => new IncomeTemplateModel
                    {
                        tip_income = SqlFunc.AggregateSum(it.tip_income),
                        agent_income = SqlFunc.AggregateSum(it.agent_income),
                        hour_income = SqlFunc.AggregateSum(it.hour_income),
                        Platform_income = SqlFunc.AggregateSum(it.Platform_income),
                        Balance = SqlFunc.AggregateSum(bt.gold)
                    }).First();
                    res = query.GroupBy((at, st, bt, it) => new { at.AnchorID, st.anchorName, st.nickName, bt.gold })
                          .Select((at, st, bt, it) => new IncomeTemplateModel
                          {
                              AnchorID = at.AnchorID,
                              AnchorName = st.anchorName,
                              NickName = st.nickName,
                              Balance = bt.gold,
                              tip_income = SqlFunc.AggregateSum(it.tip_income),
                              agent_income = SqlFunc.AggregateSum(it.agent_income),
                              hour_income = SqlFunc.AggregateSum(it.hour_income),
                              Platform_income = SqlFunc.AggregateSum(it.Platform_income),
                          })
                          .OrderBy(" sum(it.tip_income) desc")
                          .ToPageList(parm.page, parm.limit, ref totalCount);
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "主播财务报表分页信息", ex.Message, ex.StackTrace);
            }
            return res;
            #region  老版本
            //            var res = new List<IncomeTemplateModel>();
            //            try
            //            {
            //                if (parm == null)
            //                {
            //                    parm = new PageParm();
            //                }
            //                Dictionary<string, object> dic = new Dictionary<string, object>();
            //                if (!string.IsNullOrEmpty(parm.where))
            //                {
            //                    dic = JsonConvert.DeserializeObject<Dictionary<string, object>>(parm.where);
            //                }
            //                using (var db = GetInstance())
            //                {
            //                    decimal hour_income = 0;
            //                    decimal agent_income = 0;
            //                    decimal tip_income = 0;
            //                    decimal test_income = 0;
            //                    decimal Balance = 0;
            //                    var tableList = GetSqlSugarDB(DbConnType.QPAnchorRecordDB).DbMaintenance.GetTableInfoList();//获取数据库所有表名
            //                    var query = db.Queryable<SysUserAnchor, SysAnchor>((it, st) => new object[] { JoinType.Left, it.AnchorID == st.id })
            //                               .WhereIF(dic.ContainsKey("Name") && !string.IsNullOrEmpty(dic["Name"].ToString()), (it, st) => st.username.Contains(dic["Name"].ToString()) || st.nickname.Contains(dic["Name"].ToString()))
            //                               .Where((it, st) => it.UserID == OperatorProvider.Instance.Current.UserId)
            //                               .Select((it, st) => new IncomeTemplateModel
            //                               {
            //                                   AnchorID = st.id,
            //                                   AnchorName = st.username,
            //                                   NickName = st.nickname,
            //                                   Balance = st.balance,
            //                                   isCollet = st.isCollet
            //                               }).WithCache(120);
            //                    res = query.Clone().Mapper((it, cache) =>
            //                    {
            //                        if (tableList.Any(st => st.Name.Equals($@"income_{it.AnchorName}")))//判断表是否存在
            //                        {
            //                            //isnull(sum(tip_income),0) tip_income,   
            //                            var table = db.SqlQueryable<IncomeTemplateModel>($@"select  isnull(sum(hour_income),0) hour_income,isnull(sum(agent_income),0) agent_income,isnull(sum(test_income),0) test_income  
            //from QPAnchorRecordDB.dbo.income_{it.AnchorName} where opdate>='{dic["startTime"].ToString()}' and opdate<'{dic["endTime"].ToString()}'")
            //                                      .First();
            //                            it.hour_income = table.hour_income;
            //                            it.agent_income = table.agent_income;
            //                            it.test_income = table.test_income;
            //                        }
            //                        if (tableList.Any(st => st.Name.Equals($@"tip_{it.AnchorName}")))//判断表是否存在
            //                        {
            //                            //礼物金额
            //                            var totalamount = db.SqlQueryable<TipTemplateModel>($@"select sum(totalamount) as totalamount from QPAnchorRecordDB.dbo.tip_{it.AnchorName}
            //where sendtime>='{dic["startTime"].ToString()}' and sendtime<'{dic["endTime"].ToString()}'").First().totalamount;
            //                            it.tip_income = totalamount;
            //                        }
            //                    })
            //                    .ToList().OrderByDescending(it => it.tip_income).Skip((parm.page - 1) * parm.limit).Take(parm.limit).ToList();
            //                    // .ToPageList(parm.page, parm.limit, ref totalCount);

            //                    totalCount = query.Mapper((it, cache) =>//求和
            //                    {
            //                        if (tableList.Any(st => st.Name.Equals($@"income_{it.AnchorName}")))//判断表是否存在
            //                        {
            //                            //isnull(sum(tip_income),0) tip_income,   
            //                            var table = db.SqlQueryable<IncomeTemplateModel>($@"select  isnull(sum(hour_income),0) hour_income,isnull(sum(agent_income),0) agent_income,isnull(sum(test_income),0) test_income  
            //from QPAnchorRecordDB.dbo.income_{it.AnchorName} where opdate>='{dic["startTime"].ToString()}' and opdate<'{dic["endTime"].ToString()}'")
            //                                      .First();
            //                            hour_income += table.hour_income;
            //                            agent_income += table.agent_income;
            //                            test_income += table.test_income;
            //                        }
            //                        if (tableList.Any(st => st.Name.Equals($@"tip_{it.AnchorName}")))//判断表是否存在
            //                        {
            //                            //礼物金额
            //                            var totalamount = db.SqlQueryable<TipTemplateModel>($@"select sum(totalamount) as totalamount from QPAnchorRecordDB.dbo.tip_{it.AnchorName}
            //where sendtime>='{dic["startTime"].ToString()}' and sendtime<'{dic["endTime"].ToString()}'").First().totalamount;
            //                            tip_income += totalamount;
            //                        }
            //                        Balance += it.Balance;
            //                    }).ToList().Count();

            //                    sumModel = new IncomeTemplateModel
            //                    {
            //                        hour_income = hour_income,
            //                        agent_income = agent_income,
            //                        tip_income = tip_income,
            //                        test_income = test_income,
            //                        Balance = Balance
            //                    };
            //                }
            //            }
            //            catch (Exception ex)
            //            {
            //                new LogLogic().Write(Level.Error, "主播财务报表分页信息", ex.Message, ex.StackTrace);
            //            }
            //            return res;
            #endregion
        }
        /// <summary>
        /// 主播打赏礼物 分页信息
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public List<TipEntity> GetFlowDetailsPage(PageParm parm, ref int totalCount, ref decimal sumTotalAmount)
        {
            var res = new List<TipEntity>();
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
                    var query = db.Queryable<SysShopAnchorEntity, SysAnchor, TipEntity>((at, st, it) => new object[] {
                        JoinType.Left,at.AnchorID==st.id,
                        JoinType.Left, at.AnchorID == it.AnchorID })
                          .Where((at, st, it) => at.ShopID == OperatorProvider.Instance.Current.ShopID)
                          .Where((at, st, it) => it.sendtime >= Convert.ToDateTime(dic["startTime"]) && it.sendtime < Convert.ToDateTime(dic["endTime"]))
                          .WhereIF(dic.ContainsKey("userName") && !string.IsNullOrEmpty(dic["userName"].ToString()), (at, st, it) => st.anchorName.Contains(dic["userName"].ToString()) || st.nickName.Contains(dic["userName"].ToString()))
                          .WithCache(60);
                    sumTotalAmount = query.Clone().Sum((at, st, it) => it.totalamount);
                    res = query
                          .Select((at, st, it) => new TipEntity
                          {
                              orderno = it.orderno,
                              giftname = it.giftname,
                              price = it.price,
                              quantity = it.quantity,
                              ratio = it.ratio,
                              totalamount = it.totalamount,
                              username = it.username,
                              sendtime = it.sendtime,
                              AnchorName = st.anchorName,
                              AnchorNickName = st.nickName
                          })
                         .OrderBy(" it.sendtime desc")
                         .ToPageList(parm.page, parm.limit, ref totalCount);
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "主播打赏礼物 分页信息", ex.Message, ex.StackTrace);
            }
            return res;
            #region 老版本
            //var res = new List<TipTemplateModel>();
            //try
            //{
            //    if (parm == null)
            //    {
            //        parm = new PageParm();
            //    }
            //    Dictionary<string, object> dic = new Dictionary<string, object>();
            //    if (!string.IsNullOrEmpty(parm.where))
            //    {
            //        dic = JsonConvert.DeserializeObject<Dictionary<string, object>>(parm.where);

            //    }
            //    using (var db = GetSqlSugarDB(DbConnType.QPAnchorRecordDB))
            //    {
            //        var query = db.SqlQueryable<TipTemplateModel>($@"select orderno,giftname,price,quantity,ratio, totalamount,username,sendtime  from tip_" + dic["userName"].ToString()
            //                   + $@" where sendtime>='{dic["startTime"].ToString()}' and sendtime<'{dic["endTime"].ToString()}'");
            //        sumTotalAmount = query.Clone().Sum(it => it.totalamount);
            //        res = query.ToPageList(parm.page, parm.limit, ref totalCount);
            //    }
            //}
            //catch (Exception ex)
            //{
            //    new LogLogic().Write(Level.Error, "主播打赏礼物 分页信息", ex.Message, ex.StackTrace);
            //}
            //return res;
            #endregion
        }
        /// <summary>
        /// 主播工时 分页信息
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public List<HourModel> GetHourDetailsPage(PageParm parm, ref int totalCount, ref decimal sumAmount, ref decimal sumDuration)
        {
            var result = new List<HourModel>();
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
                using (var db = GetSqlSugarDB(DbConnType.QPVideoAnchorDB))
                {
                    var query = db.Queryable<SysShopAnchorEntity, SysAnchor, SysAnchorLiveRecordEntity>((at, bt, ct) => new object[] { JoinType.Left, at.AnchorID == bt.id, JoinType.Left, bt.id == ct.aid })
                                  .Where((at, bt, ct) => at.ShopID == OperatorProvider.Instance.Current.ShopID)
                                  .Where((at, bt, ct) => ct.ontime >= Convert.ToDateTime(dic["startTime"]) && ct.ontime < Convert.ToDateTime(dic["endTime"]))
                                  .WhereIF(dic.ContainsKey("isLive") && Convert.ToInt32(dic["isLive"]) == 1, (at, bt, ct) => SqlFunc.IsNullOrEmpty(ct.uptime))
                                  .WhereIF(dic.ContainsKey("isLive") && Convert.ToInt32(dic["isLive"]) == 0, (at, bt, ct) => !SqlFunc.IsNullOrEmpty(ct.uptime))
                                  .WhereIF(dic.ContainsKey("userName") && Convert.ToInt32(dic["userName"]) != -1, (at, bt, ct) => bt.id == Convert.ToInt32(dic["userName"]))
                                  .WithCache(30);//缓存30秒
                    var sumReuslt = query.Clone().Select((at, bt, ct) => new { amount = SqlFunc.AggregateSum(ct.amount), duration = SqlFunc.AggregateSum(ct.livetime) }).First();
                    sumAmount = sumReuslt.amount;
                    sumDuration = sumReuslt.duration;
                    return query
                          .Select((at, bt, ct) => new HourModel
                          {
                              AnchorName = bt.anchorName,
                              NickName = bt.nickName,
                              begintime = ct.ontime,
                              endtime = ct.uptime,
                              duration = ct.livetime,
                              islive = SqlFunc.IIF(SqlFunc.IsNullOrEmpty(ct.uptime), 1, 0)
                          })
                          .OrderBy(" ct.ontime desc")
                          .ToPageList(parm.page, parm.limit, ref totalCount);
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "主播工时 分页信息", ex.Message, ex.StackTrace);
            }
            return result;
        }
        /// <summary>
        /// 主播名称下拉框
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <param name="totalCount"></param>
        /// <returns></returns>
        public string AnchorUserNameSelect()
        {
            var result = "";
            try
            {
                using (var db = GetInstance())
                {
                    result = db.Queryable<SysShopAnchorEntity, SysAnchor>((st, it) => new object[] { JoinType.Left, st.AnchorID == it.id })
                                     .Where((st, it) => st.ShopID == OperatorProvider.Instance.Current.ShopID)
                                     .Select((st, it) => new
                                     {
                                         nickName = string.IsNullOrEmpty(it.nickName) ? it.anchorName : it.nickName,
                                         userName = it.anchorName,
                                     }).ToJson();
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "主播名称下拉框", ex.Message, ex.StackTrace);
            }
            return result;
        }
        /// <summary>
        /// 主播名称下拉框 ID和昵称
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <param name="totalCount"></param>
        /// <returns></returns>
        public string AnchorUserIDSelect()
        {
            var result = "";
            try
            {
                using (var db = GetInstance())
                {
                    result = db.Queryable<SysShopAnchorEntity, SysAnchor>((st, it) => new object[] { JoinType.Left, st.AnchorID == it.id })
                                    .Where((st, it) => st.ShopID == OperatorProvider.Instance.Current.ShopID)
                                    .Select((st, it) => new
                                    {
                                        nickName = string.IsNullOrEmpty(it.nickName) ? it.anchorName : it.nickName,
                                        it.id
                                    }).ToJson();
                }
            }
            catch (Exception ex)
            {
                new LogLogic().Write(Level.Error, "主播名称下拉框", ex.Message, ex.StackTrace);
            }
            return result;
        }
        /// <summary>
        /// 删除用户的主播
        /// </summary>
        /// <param name="userIds"></param>
        /// <returns></returns>
        public int Delete(string[] primaryKeys)
        {
            using (var db = GetInstance())
            {
                try
                {
                    db.Ado.BeginTran();
                    foreach (string primaryKey in primaryKeys)
                    {
                        db.Deleteable<SysUserAnchor>().Where(it => it.UserID == primaryKey).ExecuteCommand();
                    }
                    db.Ado.CommitTran();
                    return 1;
                }
                catch (Exception ex)
                {
                    db.Ado.RollbackTran();
                    return 0;
                }
            }
        }
        /// <summary>
        /// 获取公司代码集合
        /// </summary>
        /// <returns></returns>
        public string selectCompanyCodeList()
        {
            using (var db = GetInstance())
            {
                return db.UnionAll(db.Queryable<CompanyEntity>()
                        .Select((it) => new SelectModel
                        {
                            Name = it.code,
                            ID = it.id,
                        }),
                        db.Queryable<SubCompanyCodeEntity>()
                        .Select((st) => new SelectModel
                        {
                            Name = st.code,
                            ID = st.id,
                        })).ToJson();
            }
        }
    }
}
