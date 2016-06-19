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

        public static List<DBO.Article> FilterCategories(List<DBO.Article> articles, List<int> categoryIds)
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
    }
}