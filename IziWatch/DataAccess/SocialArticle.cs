using System;
using System.Collections.Generic;
using System.Linq;

namespace IziWatch.DataAccess
{
    public class SocialArticle
    {
        public static bool CreateSocialArticle(DBO.SocialArticle socialArticle)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_SocialArticle t_socialArticle = new T_SocialArticle()
                    {
                        id = socialArticle.Id,
                        article_id = socialArticle.ArticleId,
                        social_id = socialArticle.SocialId
                    };
                    bdd.T_SocialArticle.Add(t_socialArticle);
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool DeleteSocialArticle(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    bdd.T_SocialArticle.Remove(bdd.T_SocialArticle.Where(x => x.id == id).FirstOrDefault());
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool UpdateSocialArticle(DBO.SocialArticle socialArticle)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_SocialArticle t_socialArticle = bdd.T_SocialArticle.Where(x => x.id == socialArticle.Id).FirstOrDefault();
                    if (t_socialArticle != null)
                    {
                        t_socialArticle.id = socialArticle.Id;
                        t_socialArticle.article_id = socialArticle.ArticleId;
                        t_socialArticle.social_id = socialArticle.SocialId;
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
        public static DBO.SocialArticle GetSocialArticle(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    var query = from socialArticle in bdd.T_SocialArticle
                                where socialArticle.id == id
                                select socialArticle;

                    if (query.Any())
                    {
                        return new DBO.SocialArticle()
                        {
                            Id = query.First().id,
                            ArticleId = query.First().article_id,
                            SocialId = query.First().social_id
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

        public static List<DBO.SocialArticle> GetListSocialArticle()
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    List<DBO.SocialArticle> listSocialArticles = new List<DBO.SocialArticle>();

                    var query = from socialArticle in bdd.T_SocialArticle
                                select socialArticle;

                    foreach (var element in query)
                    {
                        listSocialArticles.Add(new DBO.SocialArticle()
                        {
                            Id = element.id,
                            ArticleId = element.article_id,
                            SocialId = element.social_id
                        });
                    }
                    return listSocialArticles;
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }
    }
}