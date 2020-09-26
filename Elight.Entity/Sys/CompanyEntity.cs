using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Entity.Sys
{
    [SugarTable("QPVideoAnchorDB.dbo.dt_company")]
    public class CompanyEntity
    {
        public int id { get; set; }
       
        /// <summary>
        /// 公司代码
        /// </summary>
        public string code { get; set; }

        /// <summary>
        /// 是否禁用 0否 1是
        /// </summary>
        public int islock { get; set; }
        /// <summary>
        /// 创建人
        /// </summary>
        public string createBy { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime createTime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string token { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string remark { get; set; }

    }
}
