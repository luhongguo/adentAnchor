using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Elight.WebUI.Controllers;
using Elight.WebUI.Filters;
using Elight.Logic.Sys;
using Elight.Entity.Sys;
using Elight.Utility.ResponseModels;
using Elight.Utility.Extension;
using Elight.Utility.Format;

namespace Elight.WebUI.Areas.System.Controllers
{
    [LoginChecked]
    public class ItemsDetailController : BaseController
    {
        private SysItemsDetailLogic itemDetaillogic;

        public ItemsDetailController()
        {
            itemDetaillogic = new SysItemsDetailLogic();
        }

        [HttpGet, AuthorizeChecked]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost, AuthorizeChecked]
        public ActionResult Index(int pageIndex, int pageSize, string itemId, string keyWord)
        {
            int totalCount = 0;
            var pageData = itemDetaillogic.GetList(pageIndex, pageSize, itemId, keyWord, ref totalCount);
            var result = new LayPadding<SysItemDetail>()
            {
                result = true,
                msg = "success",
                list = pageData,
                count = totalCount//pageData.Count
            };
            return Content(result.ToJson());
        }

        [HttpGet, AuthorizeChecked]
        public ActionResult Form()
        {
            return View();
        }

        [HttpPost, AuthorizeChecked, ValidateAntiForgeryToken]
        public ActionResult Form(SysItemDetail model)
        {
            if (model.Id.IsNullOrEmpty())
            {
                int row = itemDetaillogic.Insert(model);
                return row > 0 ? Success() : Error();
            }
            else
            {
                int row = itemDetaillogic.Update(model);
                return row > 0 ? Success() : Error();
            }
        }

        [HttpGet, AuthorizeChecked]
        public ActionResult Detail()
        {
            return View();
        }

        [HttpPost, AuthorizeChecked]
        public ActionResult Delete(string primaryKey)
        {
            int row = itemDetaillogic.Delete(primaryKey);
            return row > 0 ? Success() : Error();
        }

        [HttpPost]
        public ActionResult GetForm(string primaryKey)
        {
            SysItemDetail entity = itemDetaillogic.Get(primaryKey);
            entity.IsDefault = entity.IsDefault == "1" ? "true" : "false";
            entity.IsEnabled = entity.IsEnabled == "1" ? "true" : "false";
            return Content(entity.ToJson());
        }

    }
}
