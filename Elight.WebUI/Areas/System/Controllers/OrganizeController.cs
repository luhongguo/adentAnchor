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
using Elight.Utility.Format;
using Elight.Utility.ResponseModels;

namespace Elight.WebUI.Areas.System.Controllers
{
    public class OrganizeController : BaseController
    {
        private SysOrganizeLogic organizeLogic;

        public OrganizeController()
        {
            organizeLogic = new SysOrganizeLogic();
        }

        [HttpGet, AuthorizeChecked]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost, AuthorizeChecked]
        public ActionResult Index(int pageIndex, int pageSize, string keyWord)
        {
            int totalCount = 0;
            var pageData = organizeLogic.GetList(pageIndex, pageSize, keyWord, ref totalCount);
            var result = new LayPadding<SysOrganize>()
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
        public ActionResult Form(SysOrganize model)
        {
            if (model.Id.IsNullOrEmpty())
            {
                int row = organizeLogic.Insert(model);
                return row > 0 ? Success() : Error();
            }
            else
            {
                int row = organizeLogic.Update(model);
                return row > 0 ? Success() : Error();
            }
        }

        [HttpPost]
        public ActionResult GetForm(string primaryKey)
        {
            var entity = organizeLogic.Get(primaryKey);
            return Content(entity.ToJson());
        }

        [HttpPost, AuthorizeChecked]
        public ActionResult Delete(string primaryKey)
        {
            int count = organizeLogic.GetChildCount(primaryKey);
            if (count == 0)
            {
                int row = organizeLogic.Delete(primaryKey);
                return row > 0 ? Success() : Error();
            }
            return Error(string.Format("操作失败，请先删除该项的{0}个子级机构。", count));
        }

        [HttpGet, AuthorizeChecked]
        public ActionResult Detail()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetListTreeSelect()
        {
            var data = organizeLogic.GetList();
            var treeList = new List<TreeSelect>();
            foreach (SysOrganize item in data)
            {
                TreeSelect model = new TreeSelect();
                model.id = item.Id;
                model.text = item.FullName;
                model.parentId = item.ParentId;
                treeList.Add(model);
            }
            return Content(treeList.ToTreeSelectJson());
        }
    }
}
