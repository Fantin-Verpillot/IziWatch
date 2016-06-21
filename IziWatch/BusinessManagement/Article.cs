using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class Article
    {
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
            return DataAccess.Article.CreateArticle(article);
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