using System.Threading.Tasks;
using SqlSugar;
using Elight.Utility.Model;
namespace Elight.Utility.DBHelper
{
    public static class QueryableExtension
    {
        /// <summary>
        /// 读取列表
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="query"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="isOrderBy"></param>
        /// <returns></returns>
        public static async Task<Page<T>> ToPageAsyncs<T>(this ISugarQueryable<T> query,
            int pageIndex,
            int pageSize,
            bool isOrderBy = false)
        {
            var page = new Page<T>();
            var totalItems = await query.CountAsync();
            page.CurrentPage = pageIndex;
            page.PageSize = pageSize;
            page.Total = totalItems;
            page.Items = totalItems == 0 ? null : query.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            return page;
        }

        /// <summary>
        /// 读取列表
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="query"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="isOrderBy"></param>
        /// <returns></returns>
        public static Page<T> ToPages<T>(this ISugarQueryable<T> query,
            int pageIndex,
            int pageSize,
            bool isOrderBy = false)
        {
            var page = new Page<T>();
            var totalItems = query.Count();
            page.Items = query.ToPageList(pageIndex, pageSize, ref totalItems);
            page.CurrentPage = pageIndex;
            page.PageSize = pageSize;
            page.Total = totalItems;

            return page;
        }
       
    }
}
