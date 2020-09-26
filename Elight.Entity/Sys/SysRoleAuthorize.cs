using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Entity.Sys
{
    [SugarTable("Sys_RoleAuthorize")]
    public partial class SysRoleAuthorize
    {
        [SugarColumn(ColumnName = "Id", IsPrimaryKey = true)]

        public string Id { get; set; }


        [SugarColumn(ColumnName = "RoleId")]
        public string RoleId { get; set; }

        /// <summary>
        /// 权限模块ID
        /// </summary>
        [SugarColumn(ColumnName = "ModuleId")]
        public string ModuleId { get; set; }

        [SugarColumn(ColumnName = "CreateUser")]
        public string CreateUser { get; set; }

        [SugarColumn(ColumnName = "CreateTime")]
        public DateTime? CreateTime { get; set; }



    }

}
