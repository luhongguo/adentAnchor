using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Entity.Sys
{
    [SugarTable("QPVideoAnchorDB.dbo.dt_sub_company")]
    public class SubCompanyCodeEntity
    {
        /// <summary>
        /// 
        /// </summary>
        public int id { get; set; }

        /// <summary>
        /// 父级代码
        /// </summary>
        public string parentCode { get; set; }

        /// <summary>
        /// 子公司代码
        /// </summary>
        public string code { get; set; }

        /// <summary>
        /// 公司名称
        /// </summary>
        public string name { get; set; }

        /// <summary>
        /// 备注 
        /// </summary>
        public string remark { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime createTime { get; set; }

        /// <summary>
        /// token值
        /// </summary>
        public string token { get; set; }

        /// <summary>
        /// 是否禁用 0否 1是
        /// </summary>
        public int islock { get; set; }

    }
}
