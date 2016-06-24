using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace IziWatch.Controllers
{
    public class ArticleController : Controller
    {
        [HttpGet]
        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            DBO.Article article = BusinessManagement.Article.GetArticle((int)id);
            
            ViewBag.article = article;

            if (article == null)
            {
                return HttpNotFound();
            }
            else
            {
                if (Request["action"] == "like")
                {
                    // TODO : if user is logged, display button and increment
                    DBO.User user = new DBO.User();
                    BusinessManagement.Article.LikeArticle(article, user);
                }
                BusinessManagement.Article.IncrementArticleViews(article);
            }

            return View();
        }
    }
}