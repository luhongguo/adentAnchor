using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Elight.Entity.Sys;
using Elight.Logic.Base;
using SqlSugar;
using Elight.Utility.Operator;
using Elight.Utility.Extension;

namespace Elight.Logic.Sys
{
    public class SysRoleLogic : BaseLogic
    {
        /// <summary>
        /// 得到角色列表
        /// </summary>
        /// <returns></returns>
        public List<SysRole> GetList()
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysRole, SysOrganize>((A, B) => new object[] {
                    JoinType.Left,B.Id == A.OrganizeId
                }).Where((A, B) => A.DeleteMark == "0").Select((A, B) => new SysRole
                {
                    Id = A.Id,
                    OrganizeId = A.OrganizeId,
                    EnCode = A.EnCode,
                    Type = A.Type,
                    Name = A.Name,
                    AllowEdit = A.AllowEdit,
                    DeleteMark = A.DeleteMark,
                    IsEnabled = A.IsEnabled,
                    Remark = A.Remark,
                    SortCode = A.SortCode,
                    CreateUser = A.CreateUser,
                    CreateTime = A.CreateTime,
                    ModifyUser = A.ModifyUser,
                    ModifyTime = A.ModifyTime,
                    DeptName = B.FullName
                }).ToList();
            }
        }

        /// <summary>
        /// 获得角色列表分页
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWord"></param>
        /// <param name="totalCount"></param>
        /// <returns></returns>
        public List<SysRole> GetList(int pageIndex, int pageSize, string keyWord, ref int totalCount)
        {
            using (var db = GetInstance())
            {
                if (keyWord.IsNullOrEmpty())
                {
                    totalCount = db.Queryable<SysRole>().Where(it => it.DeleteMark == "0").Count();
                    return db.Queryable<SysRole, SysOrganize>((A, B) => new object[] {
                        JoinType.Left,B.Id == A.OrganizeId
                     }).Where((A, B) => A.DeleteMark == "0").OrderBy((A, B) => A.SortCode).Select((A, B) => new SysRole
                     {
                         Id = A.Id,
                         OrganizeId = A.OrganizeId,
                         EnCode = A.EnCode,
                         Type = A.Type,
                         Name = A.Name,
                         AllowEdit = A.AllowEdit,
                         DeleteMark = A.DeleteMark,
                         IsEnabled = A.IsEnabled,
                         Remark = A.Remark,
                         SortCode = A.SortCode,
                         CreateUser = A.CreateUser,
                         CreateTime = A.CreateTime,
                         ModifyUser = A.ModifyUser,
                         ModifyTime = A.ModifyTime,
                         DeptName = B.FullName
                     }).ToPageList(pageIndex, pageSize);
                }
                totalCount = db.Queryable<SysRole>().Where(it => it.DeleteMark == "0" && (it.Name.Contains(keyWord) || it.EnCode.Contains(keyWord))).Count();
                return db.Queryable<SysRole, SysOrganize>((A, B) => new object[] {
                    JoinType.Left,B.Id == A.OrganizeId
                }).Where((A, B) => A.DeleteMark == "0" && (A.Name.Contains(keyWord) || A.EnCode.Contains(keyWord))).OrderBy((A, B) => A.SortCode).Select((A, B) => new SysRole
                {
                    Id = A.Id,
                    OrganizeId = A.OrganizeId,
                    EnCode = A.EnCode,
                    Type = A.Type,
                    Name = A.Name,
                    AllowEdit = A.AllowEdit,
                    DeleteMark = A.DeleteMark,
                    IsEnabled = A.IsEnabled,
                    Remark = A.Remark,
                    SortCode = A.SortCode,
                    CreateUser = A.CreateUser,
                    CreateTime = A.CreateTime,
                    ModifyUser = A.ModifyUser,
                    ModifyTime = A.ModifyTime,
                    DeptName = B.FullName
                }).ToPageList(pageIndex, pageSize);
            }
        }

        /// <summary>
        /// 新增角色
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Insert(SysRole model)
        {
            using (var db = GetInstance())
            {
                model.Id = Guid.NewGuid().ToString().Replace("-", "");
                model.IsEnabled = model.IsEnabled == null ? "0" : "1";
                model.AllowEdit = model.AllowEdit == null ? "0" : "1";
                model.DeleteMark = "0";
                model.CreateUser = OperatorProvider.Instance.Current.Account;
                model.CreateTime = DateTime.Now;
                model.ModifyUser = model.CreateUser;
                model.ModifyTime = model.CreateTime;
                return db.Insertable<SysRole>(model).ExecuteCommand();
            }
        }

        /// <summary>
        /// 更新角色信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Update(SysRole model)
        {
            using (var db = GetInstance())
            {
                model.IsEnabled = model.IsEnabled == null ? "0" : "1";
                model.AllowEdit = model.AllowEdit == null ? "0" : "1";
                model.ModifyUser = OperatorProvider.Instance.Current.Account;
                model.ModifyTime = DateTime.Now;
                return db.Updateable<SysRole>(model).UpdateColumns(it => new
                {
                    it.OrganizeId,
                    it.EnCode,
                    it.Type,
                    it.Name,
                    it.AllowEdit,
                    it.IsEnabled,
                    it.Remark,
                    it.SortCode,
                    it.ModifyUser,
                    it.ModifyTime
                }).ExecuteCommand();
            }
        }

        /// <summary>
        /// 根据主键得到角色信息
        /// </summary>
        /// <param name="primaryKey"></param>
        /// <returns></returns>
        public SysRole Get(string primaryKey)
        {
            using (var db = GetInstance())
            {
                //return db.Queryable<SysRole>().InSingle(primaryKey);
                return db.Queryable<SysRole, SysOrganize>((A, B) => new object[] {
                    JoinType.Left,B.Id == A.OrganizeId
                }).Where((A, B) => A.Id == primaryKey).Select((A, B) => new SysRole
                {
                    Id = A.Id,
                    OrganizeId = A.OrganizeId,
                    EnCode = A.EnCode,
                    Type = A.Type,
                    Name = A.Name,
                    AllowEdit = A.AllowEdit,
                    DeleteMark = A.DeleteMark,
                    IsEnabled = A.IsEnabled,
                    Remark = A.Remark,
                    SortCode = A.SortCode,
                    CreateUser = A.CreateUser,
                    CreateTime = A.CreateTime,
                    ModifyUser = A.ModifyUser,
                    ModifyTime = A.ModifyTime,
                    DeptName = B.FullName
                }).First();
            }
        }
        /// <summary>
        /// 删除角色信息
        /// </summary>
        /// <param name="primaryKeys"></param>
        /// <returns></returns>
        public int Delete(string[] primaryKeys)
        {
            using (var db = GetInstance())
            {
                return db.Deleteable<SysRole>().In(primaryKeys).ExecuteCommand();
            }
        }
    }
}
