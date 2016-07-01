﻿using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
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
            DBO.Popularity popularity = null;
            List<DBO.Comment> comments = new List<DBO.Comment>();
            int countLikes = 0;

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
                    else if (Request["action"] == "Commenter")
                    {
                        DBO.Comment comment = new DBO.Comment();
                        comment.Title = Request["commentTitle"];
                        comment.Text = Request["commentText"];
                        comment.ArticleId = article.Id;
                        comment.UserId = user.Id;
                        BusinessManagement.Comment.CreateComment(comment);
                    }
                    BusinessManagement.Article.ViewArticle(article, user);
                    popularity = BusinessManagement.Popularity.GetPopularityByUserAndArticle(article, user);
                }
                BusinessManagement.Article.IncrementArticleViews(article);
                comments = BusinessManagement.Comment.GetCommentsByArticle(article);
                countLikes = BusinessManagement.Popularity.countLikeArticle(article);
            }

            ViewBag.userConnected = user;
            ViewBag.article = article;
            ViewBag.comments = comments;
            ViewBag.popularity = popularity;
            ViewBag.countLikes = countLikes;
            ViewBag.pageUrl = Request.Url;
            return View();
        }
    }
}