using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace Elight.Entity.Sys
{
    [SugarTable("QPVideoAnchorDB.dbo.dt_anchor")]
    public partial class SysAnchor : ModelContext
    {
        [SugarColumn(ColumnName = "id")]
        public int id { get; set; }
        /// <summary>
        /// 主播账号
        /// </summary>
        [SugarColumn(ColumnName = "username")]
        public string username { get; set; }
        /// <summary>
        /// 主播昵称
        /// </summary>
        [SugarColumn(ColumnName = "nickname")]
        public string nickname { get; set; }

        [SugarColumn(ColumnName = "idcard")]
        public string idcard { get; set; }

        [SugarColumn(ColumnName = "photo")]
        public string photo { get; set; }


        [SugarColumn(ColumnName = "avatar")]
        public string avatar { get; set; }

        [SugarColumn(ColumnName = "sex")]
        public int sex { get; set; }

        [SugarColumn(ColumnName = "status")]
        public string status { get; set; }

        [SugarColumn(ColumnName = "telphone")]
        public string telphone { get; set; }

        [JsonConverter(typeof(DateTimeToJson))]
        [SugarColumn(ColumnName = "regtime")]
        public DateTime? regtime { get; set; }

        [SugarColumn(ColumnName = "regip")]
        public string regip { get; set; }


        [SugarColumn(ColumnName = "balance")]
        public decimal balance { get; set; }


        [SugarColumn(ColumnName = "type")]
        public string type { get; set; }


        [SugarColumn(ColumnName = "company")]
        public string company { get; set; }
        /// <summary>
        /// 连麦状态 live 直播 offline 离线  normal正常 kickline踢线  disabled禁用
        /// </summary>
        [SugarColumn(ColumnName = "lmstatus")]
        public string lmstatus { get; set; }// { get { return this.OrganizeSingle.FullName; } }

        [SugarColumn(ColumnName = "superior")]
        public string superior { get; set; }

        [SugarColumn(ColumnName = "salt")]
        public string salt { get; set; }
        [SugarColumn(ColumnName = "password")]
        public string password { get; set; }
        [SugarColumn(ColumnName = "location")]
        public string location { get; set; }
        [SugarColumn(ColumnName = "signature")]
        public string signature { get; set; }
        [SugarColumn(ColumnName = "userid")]
        public string userid { get; set; }
        [SugarColumn(ColumnName = "pushtime")]
        public DateTime? pushtime { get; set; }
        [SugarColumn(ColumnName = "isded")]
        public int isded { get; set; }
        [SugarColumn(ColumnName = "isheadoffice")]
        public int isheadoffice { get; set; }
        [SugarColumn(ColumnName = "isrecommend")]
        public int isrecommend { get; set; }
        [SugarColumn(ColumnName = "anchorlabel")]
        public string anchorlabel { get; set; }
        [SugarColumn(ColumnName = "viplevel")]
        public int viplevel { get; set; }
        [SugarColumn(ColumnName = "birthday")]
        [JsonConverter(typeof(DateTimeToJson))]
        public DateTime? birthday { get; set; }
        [SugarColumn(ColumnName = "height")]
        public int height { get; set; }
        [SugarColumn(ColumnName = "weight")]
        public decimal weight { get; set; }
        [SugarColumn(ColumnName = "bust")]
        public decimal bust { get; set; }
        [SugarColumn(ColumnName = "waist")]
        public decimal waist { get; set; }
        [SugarColumn(ColumnName = "hip")]
        public decimal hip { get; set; }
        [SugarColumn(ColumnName = "bra")]
        public string bra { get; set; }
        [SugarColumn(ColumnName = "atteCount")]
        public int atteCount { get; set; }
        [SugarColumn(ColumnName = "platform")]
        public string platform { get; set; }
        [SugarColumn(ColumnName = "ptype")]
        public string ptype { get; set; }
        [SugarColumn(ColumnName = "isouterlink")]
        public int isouterlink { get; set; }
        [SugarColumn(ColumnName = "pgame")]
        public string pgame { get; set; }
        [SugarColumn(ColumnName = "roleData")]
        public string roleData { get; set; }
        [SugarColumn(ColumnName = "sort")]
        public int sort { get; set; }
        [SugarColumn(ColumnName = "companycode")]
        public string companycode { get; set; }
        [SugarColumn(ColumnName = "country")]
        public string country { get; set; }
        [SugarColumn(ColumnName = "ishot")]
        public int ishot { get; set; }
        [SugarColumn(ColumnName = "gameName")]
        public string gameName { get; set; }
        /// <summary>
        /// 是否是采集主播  1 是  0不是
        /// </summary>
        [SugarColumn(ColumnName = "isCollet")]
        public int isCollet { get; set; }
        [SugarColumn(ColumnName = "isColletCode")]
        public string isColletCode { get; set; }

    }
}
