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

            // TODO : get connected user and test connection
            DBO.User user = BusinessManagement.User.GetListUser().First();
            DBO.Article article = BusinessManagement.Article.GetArticle((int)id);
            
            if (article == null)
            {
                return HttpNotFound();
            }
            else
            {
                if (user != null)
                {
                    if (Request["action"] == "like")
                    {
                        BusinessManagement.Article.LikeArticle(article, user);
                    }
                    else if (Request["action"] == "unlike")
                    {
                        BusinessManagement.Article.UnlikeArticle(article, user);
                    }
                    else if (Request["action"] == "comment")
                    {
                        DBO.Comment comment = new DBO.Comment();
                        comment.Title = Request["commentTitle"];
                        comment.Text = Request["commentText"];
                        comment.ArticleId = article.Id;
                        comment.UserId = user.Id;
                        BusinessManagement.Comment.CreateComment(comment);
                    }
                    BusinessManagement.Article.ViewArticle(article, user);
                }
                BusinessManagement.Article.IncrementArticleViews(article);
            }

            ViewBag.userConnected = user;
            ViewBag.article = article;
            return View();
        }
    }
}