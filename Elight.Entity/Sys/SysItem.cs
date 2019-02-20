using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Entity.Sys
{ 
    [SugarTable("Sys_Item")]
    public partial class SysItem
    {
        [SugarColumn(ColumnName = "Id", IsPrimaryKey = true)]
        public string Id { get; set; }

        [SugarColumn(ColumnName = "EnCode")]
        public string EnCode { get; set; }

        [SugarColumn(ColumnName = "ParentId")]
        public string ParentId { get; set; }

        [SugarColumn(ColumnName = "Name")]
        public string Name { get; set; }

        [SugarColumn(ColumnName = "Layer")]
        public int? Layer { get; set; }

        [SugarColumn(ColumnName = "SortCode")]
        public int? SortCode { get; set; }

        [SugarColumn(ColumnName = "IsTree")]
        public string IsTree { get; set; }

        [SugarColumn(ColumnName = "DeleteMark")]
        public string DeleteMark { get; set; }

        [SugarColumn(ColumnName = "IsEnabled")]
        public string IsEnabled { get; set; }

        [SugarColumn(ColumnName = "Remark")]
        public string Remark { get; set; }


        [SugarColumn(ColumnName = "CreateUser")]
        public string CreateUser { get; set; }


        [SugarColumn(ColumnName = "CreateTime")]
        public DateTime? CreateTime { get; set; }

        [SugarColumn(ColumnName = "ModifyUser")]
        public string ModifyUser { get; set; }

        [SugarColumn(ColumnName = "ModifyTime")]
        public DateTime? ModifyTime { get; set; }
    }
}
