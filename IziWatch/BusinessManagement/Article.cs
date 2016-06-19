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
    }
}