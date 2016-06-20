using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IziWatch.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CreateArticle()
        {
            return View();
        }

        public ActionResult CreateArticleFB()
        {
            return View();
        }

        public ActionResult CreateArticleTwitter()
        {
            return View();
        }

        public ActionResult HandleAccounts()
        {
            return View();
        }
    }
}