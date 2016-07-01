using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IziWatch.DBO;
using System.Diagnostics;

namespace IziWatch.BusinessManagement
{
    public class Article
    {
        public static DBO.Article GetArticleByMaxId()
        {
            List<DBO.Article> articles = GetListArticle();
            articles.Sort((x, y) => x.Id.CompareTo(y.Id));
            return articles[articles.Count - 1];
        }

        public static bool IncrementArticleViews(DBO.Article article)
        {
            article.Views = article.Views + 1;
            return DataAccess.Article.UpdateArticle(article);
        }

        public static List<DBO.Article> GetListArticleByDate()
        {
            List<DBO.Article> articles = DataAccess.Article.GetListArticle();
            articles.Sort((x, y) => y.Date.CompareTo(x.Date));
            return articles;
        }

        public static List<DBO.Article> FilterByCategories(List<DBO.Article> articles, List<int> categoryIds)
        {
            List<DBO.Article> filterArticles = new List<DBO.Article>();
            foreach (DBO.Article article in articles)
            {
                if (categoryIds.Contains(article.CategoryId))
                {
                    filterArticles.Add(article);
                }
            }
            return filterArticles;
        }

        public static List<DBO.Article> FilterByFavorites(List<DBO.Article> articles, DBO.User user)
        {
            List<DBO.Article> filterArticles = new List<DBO.Article>();
            foreach (DBO.Article article in articles)
            {
                if (BusinessManagement.Popularity.GetPopularityByUserAndArticle(article, user).Liked) {
                    filterArticles.Add(article);
                }
            }
            return filterArticles;
        }

        public static List<DBO.Article> FilterByPopularity(List<DBO.Article> articles)
        {
            List<DBO.Article> filterArticles = new List<DBO.Article>();
            List<Tuple<DBO.Article, int>> articleMarks = new List<Tuple<DBO.Article, int>>();
            int mark;
            foreach (DBO.Article article in articles)
            {
                mark = article.Views + 
                    2 * BusinessManagement.Comment.countCommentArticle(article) +
                    5 * BusinessManagement.Popularity.countLikeArticle(article);
                articleMarks.Add(new Tuple<DBO.Article, int>(article, mark));
            }
            articleMarks.Sort((x, y) => y.Item2.CompareTo(x.Item2));
            int countOcc = 0;
            foreach (Tuple<DBO.Article, int> articleMark in articleMarks)
            {
                filterArticles.Add(articleMark.Item1);
                ++countOcc;
                if (countOcc == 10)
                {
                    break;
                }
            }
            return filterArticles;
        }

        public static bool LikeArticle(DBO.Article article, DBO.User user)
        {
            DBO.Popularity popularity = BusinessManagement.Popularity.GetPopularityByUserAndArticle(article, user);
            {
                if (popularity != null)
                {
                    popularity.Liked = true;
                    return BusinessManagement.Popularity.UpdatePopularity(popularity);
                }
            }
            return false;
        }

        public static bool UnlikeArticle(DBO.Article article, DBO.User user)
        {
            DBO.Popularity popularity = BusinessManagement.Popularity.GetPopularityByUserAndArticle(article, user);
            {
                if (popularity != null)
                {
                    popularity.Liked = false;
                    return BusinessManagement.Popularity.UpdatePopularity(popularity);
                }
            }
            return false;
        }

        public static bool ViewArticle(DBO.Article article, DBO.User user)
        {
            DBO.Popularity popularity = BusinessManagement.Popularity.GetPopularityByUserAndArticle(article, user);
            {
                if (popularity != null)
                {
                    popularity.Viewed = true;
                    return BusinessManagement.Popularity.UpdatePopularity(popularity);
                }
            }
            return false;
        }

        public static List<DBO.Article> FilterByDates(List<DBO.Article> articles, DateTime beginDate, DateTime endDate)
        {
            List<DBO.Article> filterArticles = new List<DBO.Article>();
            foreach (DBO.Article article in articles)
            {
                if (article.Date >= beginDate && article.Date <= endDate)
                {
                    filterArticles.Add(article);
                }
            }
            return filterArticles;
        }

        public static bool CreateArticle(DBO.Article article)
        {
            bool res = DataAccess.Article.CreateArticle(article);
            if (res)
            {
                DBO.Article newArticle = GetArticleByMaxId();
                List<DBO.User> users = BusinessManagement.User.GetListUser();
                DBO.Popularity popularity;
                foreach (DBO.User user in users)
                {
                    popularity = new DBO.Popularity();
                    popularity.Liked = false;
                    popularity.Viewed = false;
                    popularity.ArticleId = newArticle.Id;
                    popularity.UserId = user.Id;
                    BusinessManagement.Popularity.CreatePopularity(popularity);
                }
                return true;
            }
            return false;
        }

        public static bool DeleteArticle(long id)
        {
            return DataAccess.Article.DeleteArticle(id);
        }

        public static bool UpdateArticle(DBO.Article article)
        {
            return DataAccess.Article.UpdateArticle(article);
        }

        public static DBO.Article GetArticle(long id)
        {
            return DataAccess.Article.GetArticle(id);
        }

        public static List<DBO.Article> GetListArticle()
        {
            return DataAccess.Article.GetListArticle();
        }
    }
}