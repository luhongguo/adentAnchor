using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Utility.Model
{
    public class Page<T>
    {
        //
        // 摘要:
        //     当前页
        [JsonProperty("current_page")]
        public int CurrentPage { get; set; }
        //
        // 摘要:
        //     每页显示
        [JsonProperty("page_size")]
        public int PageSize { get; set; }
        //
        // 摘要:
        //     总页数
        [JsonProperty("total_pages")]
        public int TotalPages { get; }
        //
        // 摘要:
        //     总记录数
        [JsonProperty("total")]
        public int Total { get; set; }
        //
        // 摘要:
        //     数据
        [JsonProperty("items")]
        public List<T> Items { get; set; }
    }
}
