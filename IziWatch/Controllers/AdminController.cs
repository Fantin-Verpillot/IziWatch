using System;
using System.Collections.Generic;
using System.Diagnostics;
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

            if (Request["action"] == "Synchroniser Facebook" && Request["tokenFacebook"] != null)
            {
                List<DBO.Social> socials = BusinessManagement.Social.GetListSocial();
                List<DBO.Social> socialsFB = new List<DBO.Social>();
                foreach(DBO.Social social in socials) {
                    if (social.Type == "facebook")
                        socialsFB.Add(social);
                }

                ViewBag.IsUpdated = BusinessManagement.FacebookSocialArticles.ExecuteSeveralRequest(socialsFB, Request["tokenFacebook"]);
                ViewBag.SocialName = "Facebook";

            }
            else if (Request["action"] == "Synchroniser Twitter" && Request["tokenTwitter"] != null)
            {
                ViewBag.IsUpdated = true;
                ViewBag.SocialName = "Twitter";
            }

            return View();
        }

        [HttpGet]
        public ActionResult CreateArticle()
        {
            List<DBO.Category> categories = BusinessManagement.Category.GetListCategory();
            if (Request["id"] != null)
            {
                int id;
                if (Int32.TryParse(Request["id"], out id))
                {
                    DBO.SocialArticle socialArticle = BusinessManagement.SocialArticle.GetSocialArticle(id);
                    ViewBag.preImage = socialArticle.Image;
                    ViewBag.preText = socialArticle.Text;
                }
            }
            ViewBag.categories = categories;
            ViewBag.postData = false;
            return View();
        }

        [HttpPost]
        public ActionResult CreateArticle(DBO.Article article)
        {
            List<DBO.Category> categories = BusinessManagement.Category.GetListCategory();
            ViewBag.categories = categories;

            List<String> errors = new List<String>();

            if (Request["title"] == "")
                errors.Add("Le titre est incorrecte.");
            if (Request["image"] == "")
                errors.Add("L'URL de l'image est incorrecte.");
            if (Request["text"] == "")
                errors.Add("Le texte est incorrecte.");
            if (Request["date"] == "")
                errors.Add("La date est incorrecte.");

            if (errors.Count() == 0)
            {
                BusinessManagement.Article.CreateArticle(new DBO.Article()
                {
                    Title = Request["title"],
                    Image = Request["image"],
                    CategoryId = int.Parse(Request["category"]),
                    Text = Request["text"],
                    Date = DateTime.Parse(Request["date"])
                });
            }

            ViewBag.errors = errors;
            ViewBag.postData = true;
            return View();
        }


        public ActionResult CreateArticleFB()
        {
            List<DBO.Social> socialsFB = new List<DBO.Social>();
            List<DBO.SocialArticle> articlesFB = new List<DBO.SocialArticle>();
            foreach (DBO.Social social in BusinessManagement.Social.GetListSocial())
            {
                if (social.Type == "facebook")
                    socialsFB.Add(social);
            }

            if (Request["action"] == "Rechercher" && Request["pageIdentifier"] != null)
            {
                DBO.Social curSocial;
                foreach(DBO.SocialArticle socialArticle in BusinessManagement.SocialArticle.GetListSocialArticle())
                {
                    curSocial = BusinessManagement.Social.GetSocial(socialArticle.SocialId);
                    if (Request["pageIdentifier"] == curSocial.Identifier && curSocial.Type == "facebook")
                        articlesFB.Add(socialArticle);
                }
                ViewBag.checkedIdentifier = Request["pageIdentifier"];
            }

            ViewBag.socialsFB = socialsFB;
            ViewBag.articlesFB = articlesFB;
            return View();
        }



        public ActionResult CreateArticleTwitter()
        {
            List<DBO.Social> socialsTwitter = new List<DBO.Social>();
            List<DBO.SocialArticle> articlesTwitter = new List<DBO.SocialArticle>();

            foreach (DBO.Social social in BusinessManagement.Social.GetListSocial())
            {
                if (social.Type == "twitter")
                    socialsTwitter.Add(social);
            }

            if (Request["action"] == "Rechercher" && Request["pageIdentifier"] != null)
            {
                DBO.Social curSocial;
                foreach (DBO.SocialArticle socialArticle in BusinessManagement.SocialArticle.GetListSocialArticle())
                {
                    curSocial = BusinessManagement.Social.GetSocial(socialArticle.SocialId);
                    if (Request["pageIdentifier"] == curSocial.Identifier && curSocial.Type == "twitter")
                        articlesTwitter.Add(socialArticle);
                }
                ViewBag.checkedIdentifier = Request["pageIdentifier"];
            }

            ViewBag.articlesTwitter = articlesTwitter;
            ViewBag.socialsTwitter = socialsTwitter;
            return View();
        }

        public ActionResult HandleAccounts()
        {
            if (Request["action"] == "delete" && Request["id"] != null)
            {
                int id;
                if (int.TryParse(Request["id"], out id))
                {
                    BusinessManagement.Social.DeleteSocial(id);
                }

            }
            else if (Request["action"] == "Ajouter")
            {
                if (Request["pageName"] != null && Request["social"] != null && Request["pageIdentifier"] != null)
                {
                    DBO.Social newSocial = new DBO.Social()
                    {
                        Account = Request["pageName"],
                        Identifier = Request["pageIdentifier"],
                        Type = Request["social"]
                    };
                    BusinessManagement.Social.CreateSocial(newSocial);
                }
            }

            List<DBO.Social> socials = BusinessManagement.Social.GetListSocial();

            List<DBO.Social> socialsFB = new List<DBO.Social>();
            List<DBO.Social> socialsTwitter = new List<DBO.Social>();

            foreach(DBO.Social social in socials)
            {
                if (social.Type == "facebook")
                    socialsFB.Add(social);
                if (social.Type == "twitter")
                    socialsTwitter.Add(social);
            }

            ViewBag.socialsFB = socialsFB;
            ViewBag.socialsTwitter = socialsTwitter;
            return View();
        }
    }
}