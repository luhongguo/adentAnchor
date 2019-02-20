using Elight.Entity.Sys;
using Elight.Logic.Base;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Elight.Utility.Log;
using Elight.Utility.Network;
using Elight.Utility.Extension;

namespace Elight.Logic.Sys
{
    public class LogLogic : BaseLogic
    {
        public List<SysLog> GetList(int pageIndex, int pageSize, DateTime limitDate, string keyWord, ref int totalCount)
        {
            using (var db = GetInstance())
            {
                if (keyWord.IsNullOrEmpty())
                {
                    totalCount = db.Queryable<SysLog>().Where(it => it.CreateTime > limitDate).Count();
                    return db.Queryable<SysLog>().Where(it => it.CreateTime > limitDate).OrderBy(it => it.CreateTime, OrderByType.Desc).ToPageList((int)pageIndex, (int)pageSize);
                }
                totalCount = db.Queryable<SysLog>().Where(it => it.CreateTime > limitDate && (it.Account.Contains(keyWord) || it.RealName.Contains(keyWord))).Count();
                return db.Queryable<SysLog>().Where(it => it.CreateTime > limitDate && (it.Account.Contains(keyWord) || it.RealName.Contains(keyWord))).OrderBy(it => it.CreateTime, OrderByType.Desc).ToPageList(pageIndex, pageSize);
            }
        }

        public int Delete(DateTime keepDate)
        {
            using (var db = GetInstance())
            {
                return db.Deleteable<SysLog>().Where(it => it.CreateTime <= keepDate).ExecuteCommand();
            }
        }

        public void Write(Level level, string operation, string message, string account, string realName)
        {
            using (var db = GetInstance())
            {
                try
                {
                    SysLog log = new SysLog();
                    log.Id = Guid.NewGuid().ToString().Replace("-", "");
                    log.CreateTime = DateTime.Now;
                    log.LogLevel = LogHelper.GetEnumDescription(level);
                    log.Operation = operation;
                    log.Message = message;
                    log.Account = account;
                    log.RealName = realName;
                    log.IP = Net.Ip;
                    log.IPAddress = Net.GetAddress(Net.Ip);
                    log.Browser = Net.Browser;
                    db.Insertable<SysLog>(log).ExecuteCommand();
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    LogHelper.Write(level, operation, message, account, realName);
                }
            }
        }
    }
}
