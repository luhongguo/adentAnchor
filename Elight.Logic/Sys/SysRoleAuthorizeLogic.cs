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
    public class SysRoleAuthorizeLogic : BaseLogic
    {
        /// <summary>
        /// 获得角色权限关系
        /// </summary>
        /// <returns></returns>
        public List<SysRoleAuthorize> GetList()
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysRoleAuthorize>().ToList();
            }
        }

        /// <summary>
        /// 根据角色ID获得角色权限关系
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public List<SysRoleAuthorize> GetList(string roleId)
        {
            using (var db = GetInstance())
            {
                return db.Queryable<SysRoleAuthorize>().Where(it => it.RoleId == roleId).ToList();
            }
        }

        /// <summary>
        /// 给某个角色授权
        /// </summary>
        /// <param name="roleId"></param>
        /// <param name="perIds"></param>
        public void Authorize(string roleId, params string[] perIds)
        {
            using (var db = GetInstance())
            {
                //a.角色需要重新设置的权限ID集合。
                var listNewPerIds = perIds.ToList();
                //b.角色原有的授权信息。
                var listOldPers = GetList(roleId);


                //c.删除角色新设置和原有授权信息集合中相同的记录。
                for (int i = listOldPers.Count - 1; i >= 0; i--)
                {
                    if (listNewPerIds.Contains(listOldPers[i].ModuleId))
                    {
                        listNewPerIds.Remove(listOldPers[i].ModuleId);
                        listOldPers.Remove(listOldPers[i]);
                    }
                }
                //事物处理
                try
                {
                    db.Ado.BeginTran();
                    //d.新集合中剩下的授权信息新增到数据库。
                    listNewPerIds.ForEach((perId) =>
                    {
                        db.Insertable<SysRoleAuthorize>(new SysRoleAuthorize()
                        {
                            RoleId = roleId,
                            ModuleId = perId,
                            Id = Guid.NewGuid().ToString().Replace("-", ""),
                            CreateUser = OperatorProvider.Instance.Current.Account,
                            CreateTime = DateTime.Now
                        }).ExecuteCommand();
                    });

                    //e.旧集合中剩下的授权信息从数据库中删除。
                    listOldPers.ForEach((perObj) =>
                    {
                        db.Deleteable<SysRoleAuthorize>(perObj).ExecuteCommand();
                    });
                    db.Ado.CommitTran();
                }
                catch (Exception ex)
                {
                    db.Ado.RollbackTran();
                }
            }
        }

        /// <summary>
        /// 从角色权限关系中删除某个模块
        /// </summary>
        /// <param name="moduleIds"></param>
        /// <returns></returns>
        public int Delete(params string[] moduleIds)
        {
            using (var db = GetInstance())
            {
                try
                {
                    db.Ado.BeginTran();
                    foreach (string moduleId in moduleIds)
                    {
                        db.Deleteable<SysRoleAuthorize>().Where(it => it.ModuleId == moduleId).ExecuteCommand();
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

    }
}
