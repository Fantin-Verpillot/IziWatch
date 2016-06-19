using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IziWatch.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            List<DBO.Article> articles = BusinessManagement.Article.GetListArticleByDate();
            List<DBO.Category> categories = DataAccess.Category.GetListCategory();

            string filter = Request["action"];
            List<int> categoryIds = new List<int>();
            if (filter != null)
            {
                if (Request["categories"] != null)
                {
                    string[] categoryValues = Request["categories"].Split(',');
                    foreach (string categoryId in categoryValues)
                    {
                        categoryIds.Add(Convert.ToInt32(categoryId.Trim()));
                    }
                    articles = BusinessManagement.Article.FilterCategories(articles, categoryIds);
                }
            }

            ViewBag.articles = articles;
            ViewBag.categories = categories;
            ViewBag.categoryChecks = categoryIds;
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}