using Elight.Entity.Sys;
using Elight.Logic.Base;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Elight.Utility.Operator;

namespace Elight.Logic.Sys
{
    public class SysUserRoleRelationLogic : BaseLogic
    {
        /// <summary>
        /// 删除用户角色关系
        /// </summary>
        /// <param name="userIds"></param>
        /// <returns></returns>
        public int Delete(string[] userIds)
        {
            using (var db = GetInstance())
            {
                return db.Deleteable<SysUserRoleRelation>().In(it => it.UserId, userIds).ExecuteCommand();
            }
        }

        /// <summary>
        /// 根据ID得到用户角色关系
        /// </summary>
        /// <param name="userIds"></param>
        /// <returns></returns>
        public List<SysUserRoleRelation> GetList(string userId)
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysUserRoleRelation>().Where(it => it.UserId == userId).ToList();
            }
        }

        ///// <summary>
        ///// 设置用户角色关系
        ///// </summary>
        ///// <param name="userId"></param>
        ///// <param name="roleIds"></param>
        //public void SetRole(string userId, params string[] roleIds)
        //{
        //    using (var db = GetInstance())
        //    {
        //        //a.用户需要重新设置的角色ID集合。
        //        var listNewRoleIds = roleIds.ToList();
        //        //b.用户原有的角色信息。
        //        var listOldRRs = GetList(userId);
        //        //c.删除用户新设置和原有用户角色关系集合中相同的记录。
        //        for (int i = listOldRRs.Count - 1; i >= 0; i--)
        //        {
        //            if (listNewRoleIds.Contains(listOldRRs[i].RoleId))
        //            {
        //                listNewRoleIds.Remove(listOldRRs[i].RoleId);
        //                listOldRRs.Remove(listOldRRs[i]);
        //            }
        //        }
        //        //d.新集合中剩下的用户角色关系新增到数据库。
        //        listNewRoleIds.ForEach((roleId) =>
        //        {
        //            db.Insertable<SysUserRoleRelation>(new SysUserRoleRelation()
        //            {
        //                UserId = userId,
        //                RoleId = roleId,
        //                Id = Guid.NewGuid().ToString().Replace("-", ""),
        //                CreateUser = OperatorProvider.Instance.Current.Account,
        //                CreateTime = DateTime.Now
        //            }).ExecuteCommand();
        //        });
        //        //e.旧集合中剩下的用户角色关系从数据库中删除。
        //        listOldRRs.ForEach((rrObj) =>
        //        {
        //            db.Deleteable<SysUserRoleRelation>(rrObj).ExecuteCommand();
        //        });
        //    }
        //}
    }
}
