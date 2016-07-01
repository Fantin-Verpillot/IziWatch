using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Web.Mvc;
using System.Linq;

namespace IziWatch.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            // TODO : get connected user and test connection
            DBO.User user = BusinessManagement.User.GetListUser().First();
            List<DBO.Article> articles = BusinessManagement.Article.GetListArticleByDate();
            List<DBO.Category> categories = BusinessManagement.Category.GetListCategory();
            bool dateError = false;
            bool favoritesCheck = false;
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
                    articles = BusinessManagement.Article.FilterByCategories(articles, categoryIds);
                }
                if (Request["popular"] != null)
                {
                    articles = BusinessManagement.Article.FilterByPopularity(articles);
                }
                if (Request["favorites"] != null)
                {
                    if (user != null)
                    {
                        articles = BusinessManagement.Article.FilterByFavorites(articles, user);
                        favoritesCheck = true;
                    }
                }
                DateTime beginDate;
                DateTime endDate;
                try
                {
                    if (Request["beginDate"] == "") {
                        beginDate = DateTime.MinValue;
                    } else {
                        beginDate = DateTime.Parse(Request["beginDate"]);
                    }
                    if (Request["endDate"] == "") {
                        endDate = DateTime.MaxValue;
                    } else {
                        endDate = DateTime.Parse(Request["endDate"]);
                    }
                    articles = BusinessManagement.Article.FilterByDates(articles, beginDate, endDate);
                }
                catch (Exception e)
                {
                    dateError = true;
                    Debug.WriteLine("[DEBUG][HOME][INDEX] - Error in date format.");
                }
            }

            ViewBag.favoritesCheck = favoritesCheck;
            ViewBag.userConnected = user;
            ViewBag.dateError = dateError;
            ViewBag.articles = articles;
            ViewBag.categories = categories;
            ViewBag.categoryChecks = categoryIds;
            ViewBag.popularityCheck = Request["popular"] != null;
            ViewBag.beginDate = Request["beginDate"];
            ViewBag.endDate = Request["endDate"];
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