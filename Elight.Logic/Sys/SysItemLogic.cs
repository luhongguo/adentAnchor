using Elight.Entity.Sys;
using Elight.Logic.Base;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Elight.Utility.Operator;
using Elight.Utility.Extension;

namespace Elight.Logic.Sys
{
    public class SysItemLogic : BaseLogic
    {
    
        public List<SysItem> GetList()
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysItem>().Where(it => it.DeleteMark == "0").OrderBy(it => it.SortCode).ToList();
            }
        }

        public List<SysItem> GetList(int pageIndex, int pageSize, string keyWord, ref int totalCount)
        {
            using (var db = GetInstance())
            {
                if (keyWord.IsNullOrEmpty())
                {
                    totalCount = db.Queryable<SysItem>().Where(it => it.DeleteMark == "0").Count();
                    return db.Queryable<SysItem>().Where(it => it.DeleteMark == "0").OrderBy(it => it.SortCode).ToPageList(pageIndex, pageSize);
                }
                totalCount = db.Queryable<SysItem>().Where(it => it.DeleteMark == "0" && (it.Name.Contains(keyWord) || it.EnCode.Contains(keyWord))).Count();
                return db.Queryable<SysItem>().Where(it => it.DeleteMark == "0" && (it.Name.Contains(keyWord) || it.EnCode.Contains(keyWord))).OrderBy(it => it.SortCode).ToPageList(pageIndex, pageSize);
            }
        }


        public int GetChildCount(string parentId)
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysItem>().Where(it => it.ParentId == parentId).ToList().Count();
            }
        }


        public SysItem Get(object primaryKey)
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysItem>().InSingle(primaryKey);
            }
        }


        public int Insert(SysItem model)
        {
            using (var db = GetInstance())
            {
                model.Id = Guid.NewGuid().ToString().Replace("-", "");
                model.Layer = Get(model.ParentId).Layer += 1;
                model.IsEnabled = model.IsEnabled == null ? "0" : "1";
                model.DeleteMark = "0";
                model.CreateUser = OperatorProvider.Instance.Current.Account;
                model.CreateTime = DateTime.Now;
                model.ModifyUser = model.CreateUser;
                model.ModifyTime = model.CreateTime;
                return db.Insertable<SysItem>(model).ExecuteCommand();
            }
        }

        public int Delete(string primaryKey)
        {
            using (var db = GetInstance())
            {
                return db.Deleteable<SysItem>().Where(it => it.Id == primaryKey).ExecuteCommand();
            }
        }
        public int Update(SysItem model)
        {
            using (var db = GetInstance())
            {
                model.Layer = Get(model.ParentId).Layer += 1;
                model.IsEnabled = model.IsEnabled == null ? "0" : "1";
                model.ModifyUser = OperatorProvider.Instance.Current.Account;
                model.ModifyTime = DateTime.Now;
                return db.Updateable<SysItem>(model).UpdateColumns(it => new
                {
                    it.ParentId,
                    it.Layer,
                    it.EnCode,
                    it.Name,
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
