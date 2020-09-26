using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Entity.Sys
{
    [SugarTable("QPAnchorRecordDB.dbo.LiveCallbackHour")]
    public class LiveCallbackHourEntity
    {
        /// <summary>
        /// id
        /// </summary>
        [SugarColumn(ColumnName = "id", IsPrimaryKey = true)]
        public int id { get; set; }
        /// <summary>
        /// 推流域名
        /// </summary>
        public string app { get; set; } = "";
        /// <summary>
        /// 直播推流 ：1  直播断流：0
        /// </summary>
        public int event_type { get; set; }
        /// <summary>
        /// 用户推流 IP
        /// </summary>
        public string user_ip { get; set; } = "";
        /// <summary>
        /// 消息序列号，标识一次推流活动，一次推流活动会产生相同序列号的推流和断流消息
        /// </summary>
        public string sequence { get; set; } = "";
        /// <summary>
        /// 开始时间
        /// </summary>
        public DateTime begintime { get; set; }
        /// <summary>
        /// 结束数据
        /// </summary>
        public DateTime endtime { get; set; }
        /// <summary>
        /// 时长
        /// </summary>
        public int duration { get; set; }
        /// <summary>
        /// 主播ID
        /// </summary>
        public int stream_id { get; set; }
        /// <summary>
        /// 来源  0：腾讯，1：阿里
        /// </summary>
        public int source { get; set; }
        /// <summary>
        /// 待处理pending  已处理settled
        /// </summary>
        public string status { get; set; }
        /// <summary>
        /// 金额
        /// </summary>
        public decimal amount { get; set; }
        /// <summary>
        /// 是否直播 0否，1是
        /// </summary>
        public int islive { get; set; }
    }
}
