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
using Elight.Utility.Format;
using Elight.Utility.Extension;


namespace Elight.WebUI.Areas.System.Controllers
{
    [LoginChecked]
    public class ItemController : BaseController
    {
        private SysItemLogic itemLogic;
        private SysItemsDetailLogic itemsDetailLogic;

        public ItemController()
        {
            itemLogic = new SysItemLogic();
            itemsDetailLogic = new SysItemsDetailLogic();
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
            var pageData = itemLogic.GetList(pageIndex, pageSize, keyWord, ref totalCount);
            var result = new LayPadding<SysItem>()
            {
                result = true,
                msg = "success",
                list = pageData,
                count = totalCount//pageData.Count
            };
            return Content(result.ToJson());
        }

        [HttpGet]
        public ActionResult Form()
        {
            return View();
        }

        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Form(SysItem model)
        {
            if (model.Id.IsNullOrEmpty())
            {
                int row = itemLogic.Insert(model);
                return row > 0 ? Success() : Error();
            }
            else
            {
                int row = itemLogic.Update(model);
                return row > 0 ? Success() : Error();
            }
        }

        [HttpPost]
        public ActionResult GetForm(string primaryKey)
        {
            SysItem entity = itemLogic.Get(primaryKey);
            entity.IsEnabled = entity.IsEnabled == "1" ? "true" : "false";
            return Content(entity.ToJson());
        }

        [HttpPost]
        public ActionResult Delete(string primaryKey)
        {
            int count = itemLogic.GetChildCount(primaryKey);
            if (count == 0)
            {
                //删除字典。
                int row = itemLogic.Delete(primaryKey);
                //删除字典选项。
                itemsDetailLogic.Delete(primaryKey);
                return row > 0 ? Success() : Error();
            }
            return Warning(string.Format("操作失败，请先删除该项的{0}个子级字典。", count));
        }

        [HttpGet]
        public ActionResult Detail()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetListTree()
        {
            var listAllItems = itemLogic.GetList();
            List<ZTreeNode> result = new List<ZTreeNode>();
            foreach (var item in listAllItems)
            {
                ZTreeNode model = new ZTreeNode();
                model.id = item.Id;
                model.pId = item.ParentId;
                model.name = item.Name;
                model.open = true;
                result.Add(model);
            }
            return Content(result.ToJson());
        }

        [HttpPost]
        public ActionResult GetListSelectTree()
        {
            var data = itemLogic.GetList();
            var treeList = new List<TreeSelect>();
            foreach (var item in data)
            {
                TreeSelect model = new TreeSelect();
                model.id = item.Id;
                model.text = item.Name;
                model.parentId = item.ParentId;
                treeList.Add(model);
            }
            return Content(treeList.ToTreeSelectJson());
        }
    }
}
