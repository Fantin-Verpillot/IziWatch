using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IziWatch.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {

        public String checkArticle(DBO.Article article)
        {
            List<DBO.Category> categories = BusinessManagement.Category.GetListCategory();
            String error = null;

            if (article.Text == "" || article.Title == "" || article.Image == "")
                error = "Vous devez remplir tous les champs";

            if (error == null && BusinessManagement.Category.GetCategory(article.CategoryId) == null)
                error = "La catégorie spécifiée est introuvable.";

            return error;
        }

        // GET: Admin
        public ActionResult Index()
        {
            if (Request["action"] == "Synchroniser Facebook" && Request["tokenFacebook"] != null)
            {
                ViewBag.IsUpdated = BusinessManagement.FacebookSocialArticles.ExecuteSeveralRequest(BusinessManagement.Social.GetSocialsByType("facebook"), Request["tokenFacebook"]);
                ViewBag.SocialName = "Facebook";

            }
            else if (Request["action"] == "Synchroniser Twitter")
            {
                ViewBag.IsUpdated = BusinessManagement.TwitterSocialArticle.ExecuteSeveralRequest(BusinessManagement.Social.GetSocialsByType("twitter"));
                ViewBag.SocialName = "Twitter";
            }

            return View();
        }

        [HttpGet]
        public ActionResult CreateArticleSocialNetwork()
        {
            List<DBO.Category> categories = BusinessManagement.Category.GetListCategory();
            String socialArticleId = "0";
            if (Request["socialArticleId"] != null)
            {
                int id;
                if (Int32.TryParse(Request["socialArticleId"], out id))
                {
                    DBO.SocialArticle socialArticle = BusinessManagement.SocialArticle.GetSocialArticle(id);
                    ViewBag.preImage = socialArticle.Image;
                    ViewBag.preText = socialArticle.Text;
                    socialArticleId = Request["socialArticleId"];
                }
            }
            ViewBag.socialArticleId = socialArticleId;
            ViewBag.categories = categories;
            ViewBag.postData = false;
            return View();
        }

        [HttpPost]
        public ActionResult CreateArticleSocialNetwork(DBO.Article article)
        {
            DBO.Article newArticle = new DBO.Article()
            {
                Title = Request["title"],
                Image = Request["image"],
                CategoryId = int.Parse(Request["category"]),
                Text = Request["text"],
                Date = DateTime.Now
            };

            String error = checkArticle(newArticle);
            if (error == null)
            {
                BusinessManagement.Article.CreateArticle(newArticle);
                BusinessManagement.SocialArticle.DeleteSocialArticle(int.Parse(Request["socialArticleId"]));
            }

            ViewBag.socialArticleId = int.Parse(Request["socialArticleId"]);
            ViewBag.error = error;
            ViewBag.categories = BusinessManagement.Category.GetListCategory();
            ViewBag.partialArticle = newArticle;
            ViewBag.postData = true;
            return View();
        }

        [HttpGet]
        public ActionResult CreateArticle()
        {
            ViewBag.categories = BusinessManagement.Category.GetListCategory(); ;
            ViewBag.postData = false;
            return View();
        }

        [HttpPost]
        public ActionResult CreateArticle(DBO.Article article)
        {
            DBO.Article newArticle = new DBO.Article()
            {
                Title = Request["title"],
                Image = Request["image"],
                CategoryId = int.Parse(Request["category"]),
                Text = Request["text"],
                Date = DateTime.Now
             };

            String error = checkArticle(newArticle);
            if (error == null)
            {
                BusinessManagement.Article.CreateArticle(newArticle);
            }

            ViewBag.error = error;
            ViewBag.categories = BusinessManagement.Category.GetListCategory();
            ViewBag.postData = true;
            ViewBag.partialArticle = newArticle;
            return View();
        }


        public ActionResult ChooseArticleSocialNetwork()
        {
            string socialType = Request["socialType"] == null || Request["socialType"] == "" ? "facebook" : Request["socialType"];
            List<DBO.Social> socials = BusinessManagement.Social.GetSocialsByType(socialType);
            List<DBO.SocialArticle> socialArticles = new List<DBO.SocialArticle>();

            if (Request["action"] == "Rechercher" && Request["SocialId"] != null)
            {
                socialArticles = BusinessManagement.SocialArticle.GetSocialArticlesBySocialId(int.Parse(Request["SocialId"]));
            }

            ViewBag.socials = socials;
            ViewBag.socialArticles = socialArticles;
            
            ViewBag.checkedSocialId = Request["SocialId"] == null ? 0 : int.Parse(Request["SocialId"]);
            ViewBag.socialType = socialType;
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