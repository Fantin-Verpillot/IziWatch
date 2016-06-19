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
        public ActionResult Details(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            DBO.Article article = DataAccess.Article.GetArticle((long)id);
            ViewBag.article = article;

            if (article == null)
                return HttpNotFound();

            return View();
        }
    }
}