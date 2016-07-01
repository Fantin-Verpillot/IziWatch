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

        public ActionResult CreateArticle()
        {
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
            }

            ViewBag.socialsFB = socialsFB;
            ViewBag.articlesFB = articlesFB;
            return View();
        }

        public ActionResult CreateArticleTwitter()
        {
            List<DBO.Social> socials = BusinessManagement.Social.GetListSocial();
            List<DBO.Social> socialsTwitter = new List<DBO.Social>();

            foreach (DBO.Social social in socials)
            {
                if (social.Type == "twitter")
                    socialsTwitter.Add(social);
            }

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