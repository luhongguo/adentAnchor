using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Elight.WebUI.Controllers;
using Elight.WebUI.Filters;
using Elight.Logic.Sys;
using Elight.Entity.Sys;
using Elight.Utility.Extension;
using Elight.Utility.ResponseModels;
using Elight.Utility.Format;

namespace Elight.WebUI.Areas.System.Controllers
{
    public class LogController : BaseController
    {
        private LogLogic logLogic;

        public LogController()
        {
            logLogic = new LogLogic();
        }

        [HttpGet, AuthorizeChecked]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost, AuthorizeChecked]
        public ActionResult Index(int pageIndex, int pageSize, string queryDate, string keyWord)
        {
            DateTime limitDate = DateTime.Now.StartDateTime();

            if (!queryDate.IsNullOrEmpty())
            {
                switch (queryDate)
                {
                    case "7":
                        limitDate = DateTime.Now.AddDays(-7).StartDateTime();
                        break;
                    case "30":
                        limitDate = DateTime.Now.AddMonths(-1).StartDateTime();
                        break;
                    case "90":
                        limitDate = DateTime.Now.AddMonths(-3).StartDateTime();
                        break;
                    default:
                        limitDate = DateTime.Now.StartDateTime();
                        break;
                }
            }
            int totalCount = 0;
            var pageData = logLogic.GetList(pageIndex, pageSize, limitDate, keyWord,ref totalCount);
            var result = new LayPadding<SysLog>()
            {
                result = true,
                msg = "success",
                list = pageData,
                count = totalCount//pageData.Count
            };
            return Content(result.ToJson());
        }

        [HttpGet, AuthorizeChecked]
        public ActionResult Delete()
        {
            return View();
        }

        [HttpPost, AuthorizeChecked, ValidateAntiForgeryToken]
        public ActionResult Delete(string keepType)
        {
            DateTime keeyDate = DateTime.Now.StartDateTime();

            if (!keepType.IsNullOrEmpty())
            {
                switch (keepType)
                {
                    case "7":
                        keeyDate = DateTime.Now.AddDays(-7).StartDateTime();
                        break;
                    case "30":
                        keeyDate = DateTime.Now.AddMonths(-1).StartDateTime();
                        break;
                    case "90":
                        keeyDate = DateTime.Now.AddMonths(-3).StartDateTime();
                        break;
                    default:
                        keeyDate = DateTime.Now;
                        break;
                }
                logLogic.Delete(keeyDate);
                return Success();
            }
            return Error();
        }

    }
}
