using System;
using System.Collections.Generic;
using System.Linq;

namespace IziWatch.DataAccess
{
    public class Article
    {
        public static bool CreateArticle(DBO.Article article)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_Article t_article = new T_Article()
                    {
                        id = article.Id,
                        title = article.Title,
                        image = article.Image,
                        category_id = article.CategoryId,
                        text = article.Text,
                        date = article.Date
                    };
                    bdd.T_Article.Add(t_article);
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool DeleteArticle(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    bdd.T_Article.Remove(bdd.T_Article.Where(x => x.id == id).FirstOrDefault());
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool UpdateArticle(DBO.Article article)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_Article t_article = bdd.T_Article.Where(x => x.id == article.Id).FirstOrDefault();
                    if (t_article != null)
                    {
                        t_article.id = article.Id;
                        t_article.title = article.Title;
                        t_article.image = article.Image;
                        t_article.category_id = article.CategoryId;
                        t_article.text = article.Text;
                        t_article.date = article.Date;
                        bdd.SaveChanges();
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }
        public static DBO.Article GetArticle(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try {
                    var query = from article in bdd.T_Article
                                where article.id == id
                                select article;

                    if (query.Any())
                    {
                        return new DBO.Article()
                        {
                            Id = query.First().id,
                            Title = query.First().title,
                            Image = query.First().image,
                            CategoryId = query.First().category_id,
                            Text = query.First().text,
                            Date = query.First().date
                        };
                    }
                    else
                    {
                        return null;
                    }
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }

        public static List<DBO.Article> GetListArticle()
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try {
                    List<DBO.Article> listArticles = new List<DBO.Article>();

                    var query = from article in bdd.T_Article
                                select article;

                    foreach (var element in query)
                    {
                        listArticles.Add(new DBO.Article()
                        {
                            Id = element.id,
                            Title = element.title,
                            Image = element.image,
                            CategoryId = element.category_id,
                            Text = element.text,
                            Date = element.date
                        });
                    }
                    return listArticles;
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }
    }
}