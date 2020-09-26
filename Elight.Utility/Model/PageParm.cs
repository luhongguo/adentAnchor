﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Elight.Utility.Model
{
    public class PageParm
    {
        //
        // 摘要:
        //     当前页
        public int page { get; set; }
        //
        // 摘要:
        //     每页总条数
        public int limit { get; set; }
        //
        // 摘要:
        //     搜索关键字
        public string key { get; set; }
        //
        // 摘要:
        //     类型条件
        public int types { get; set; }
        //
        // 摘要:
        //     搜索日期，可能是2个日期，通过-分隔
        public string time { get; set; }
        //
        // 摘要:
        //     排序方式，可根据数字来判断，
        public int orderType { get; set; }
        //
        // 摘要:
        //     排序的字段
        public string field { get; set; }
        //
        // 摘要:
        //     排序的类型 asc desc
        public string order { get; set; }
        //
        // 摘要:
        //     动态条件
        public string where { get; set; }
    }
}
