using Elight.Entity.Sys;
using Elight.Logic.Base;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Elight.Utility.Operator;
using Elight.Utility.Extension;

namespace Elight.Logic.Sys
{
    public class SysOrganizeLogic : BaseLogic
    {
        public List<SysOrganize> GetList()
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysOrganize>().Where(it => it.DeleteMark == "0").ToList();
            }
        }


        public List<SysOrganize> GetList(int pageIndex, int pageSize, string keyWord, ref int totalCount)
        {
            using (var db = GetInstance())
            {
                if (keyWord.IsNullOrEmpty())
                {
                    totalCount = db.Queryable<SysOrganize>().Where(it => it.DeleteMark == "0").Count();
                    return db.Queryable<SysOrganize>().Where(it => it.DeleteMark == "0" && it.ParentId != "0").OrderBy(it => it.SortCode).ToPageList(pageIndex, pageSize);
                }
                totalCount = db.Queryable<SysOrganize>().Where(it => it.DeleteMark == "0" && (it.FullName.Contains(keyWord) || it.EnCode.Contains(keyWord))).Count();
                return db.Queryable<SysOrganize>().Where(it => it.DeleteMark == "0" && it.ParentId != "0" && (it.FullName.Contains(keyWord) || it.EnCode.Contains(keyWord))).OrderBy(it => it.SortCode).ToPageList(pageIndex, pageSize);
            }
        }



        public int GetChildCount(string parentId)
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysOrganize>().Where(it => it.ParentId == parentId).ToList().Count();
            }
        }

        public int Insert(SysOrganize model)
        {
            using (var db = GetInstance())
            {
                model.Id = Guid.NewGuid().ToString().Replace("-", "");
                model.Layer = Get(model.ParentId).Layer += 1;
                model.DeleteMark = "0";
                model.CreateUser = OperatorProvider.Instance.Current.Account;
                model.CreateTime = DateTime.Now;
                model.ModifyUser = model.CreateUser;
                model.ModifyTime = model.CreateTime;
                return db.Insertable<SysOrganize>(model).ExecuteCommand();
            }
        }

        public int Delete(string primaryKey)
        {
            using (var db = GetInstance())
            {
                return db.Deleteable<SysOrganize>().Where(it => it.Id == primaryKey).ExecuteCommand();
            }
        }
        public SysOrganize Get(object primaryKey)
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysOrganize>().InSingle(primaryKey);
            }
        }
        public int Update(SysOrganize model)
        {
            using (var db = GetInstance())
            {
                model.ModifyUser = OperatorProvider.Instance.Current.Account;
                model.ModifyTime = DateTime.Now;
                return db.Updateable<SysOrganize>(model).UpdateColumns(it => new
                {
                    it.ParentId,
                    it.Layer,
                    it.EnCode,
                    it.FullName,
                    it.Type,
                    it.ManagerId,
                    it.TelePhone,
                    it.WeChat,
                    it.Fax,
                    it.Email,
                    it.Address,
                    it.SortCode,
                    it.IsEnabled,
                    it.Remark,
                    it.ModifyUser,
                    it.ModifyTime
                }).ExecuteCommand();
            }
        }
    }
}
