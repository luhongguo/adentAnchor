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
    public class SysItemsDetailLogic : BaseLogic
    {
        public List<SysItemDetail> GetItemDetailList(string strItemCode)
        {
            using (var db = GetInstance())
            {
                SysItem item = db.Queryable<SysItem>().Where(it => it.EnCode == strItemCode).First();
                if (null == item)
                    return null;
                return db.Queryable<SysItemDetail>().Where(it => it.ItemId == item.Id).OrderBy(it => it.SortCode).ToList();
            }
        }

        public List<SysItemDetail> GetList(long pageIndex, long pageSize, string itemId, string keyWord, ref int totalCount)
        {
            using (var db = GetInstance())
            {
                if (keyWord.IsNullOrEmpty())
                {
                    totalCount = db.Queryable<SysItemDetail>().Where(it => it.DeleteMark == "0" && it.ItemId == itemId).Count();
                    return db.Queryable<SysItemDetail>().Where(it => it.DeleteMark == "0" && it.ItemId == itemId).OrderBy(it => it.SortCode).ToPageList((int)pageIndex, (int)pageSize);
                }
                totalCount = db.Queryable<SysItemDetail>().Where(it => it.DeleteMark == "0" && it.ItemId == itemId && (it.Name.Contains(keyWord) || it.EnCode.Contains(keyWord))).Count();
                return db.Queryable<SysItemDetail>().Where(it => it.DeleteMark == "0" && it.ItemId == itemId && (it.Name.Contains(keyWord) || it.EnCode.Contains(keyWord))).OrderBy(it => it.SortCode).ToPageList((int)pageIndex, (int)pageSize);
            }
        }

       

        public SysItemDetail Get(object primaryKey)
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysItemDetail>().InSingle(primaryKey);
            }
        }

        public int Insert(SysItemDetail model)
        {
            using (var db = GetInstance())
            {
                model.Id = Guid.NewGuid().ToString().Replace("-", "");
                model.IsEnabled = model.IsEnabled == null ? "0" : "1";
                model.IsDefault = model.IsDefault == null ? "0" : "1";
                model.DeleteMark = "0";
                model.CreateUser = OperatorProvider.Instance.Current.Account;
                model.CreateTime = DateTime.Now;
                model.ModifyUser = model.CreateUser;
                model.ModifyTime = model.CreateTime;
                return db.Insertable<SysItemDetail>(model).ExecuteCommand();
            }
        }

        public int Delete(string itemId)
        {
            using (var db = GetInstance())
            {
                return db.Deleteable<SysItemDetail>().In(itemId).ExecuteCommand();
            }
        }

        public int Update(SysItemDetail model)
        {
            using (var db = GetInstance())
            {
                model.IsEnabled = model.IsEnabled == null ? "0" : "1";
                model.IsDefault = model.IsDefault == null ? "0" : "1";
                model.ModifyUser = OperatorProvider.Instance.Current.Account;
                model.ModifyTime = DateTime.Now;
                return db.Updateable<SysItemDetail>(model).UpdateColumns(it => new
                {
                    it.ItemId,
                    it.EnCode,
                    it.Name,
                    it.IsDefault,
                    it.SortCode,
                    it.IsEnabled,
                    it.ModifyUser,
                    it.ModifyTime
                }).ExecuteCommand();
            }
        }

        public SysItemDetail GetSoftwareName()
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysItemDetail>().Where(it => it.EnCode == "SoftwareName").First();
            }
        }
    }
}
