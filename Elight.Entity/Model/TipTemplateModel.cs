using Elight.Entity.Sys;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Entity.Model
{
    /// <summary>
    /// 打赏类
    /// </summary>
    public class TipTemplateModel
    {
        /// <summary>
        /// 主播账号账号
        /// </summary>
        public string anchorName { get; set; }
        /// <summary>
        /// 扣款单号
        /// </summary>
        public string orderno { get; set; }
        /// <summary>
        /// 礼物名称
        /// </summary>
        public string giftname { get; set; }
        ///// <summary>
        ///// 礼物类型
        ///// </summary>
        //public string gift { get; set; }
        /// <summary>
        /// 单价
        /// </summary>
        public decimal price { get; set; }
        /// <summary>
        /// 数量
        /// </summary>
        public int quantity { get; set; }
        /// <summary>
        /// 比率
        /// </summary>
        public int ratio { get; set; }
        /// <summary>
        /// 总金额
        /// </summary>
        public decimal totalamount { get; set; }
        /// <summary>
        /// 打赏人
        /// </summary>
        public string username { get; set; }
        /// <summary>
        /// 打赏时间
        /// </summary>
        [JsonConverter(typeof(DateTimeToJson))]
        public DateTime sendtime { get; set; }
        /// <summary>
        /// 是否是采集主播  1 是  0不是
        /// </summary>
        public int isCollet { get; set; }
    }
}
