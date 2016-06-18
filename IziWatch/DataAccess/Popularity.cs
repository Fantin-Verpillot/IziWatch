using System;
using System.Collections.Generic;
using System.Linq;

namespace IziWatch.DataAccess
{
    public class Popularity
    {
        public static bool CreatePopularity(DBO.Popularity popularity)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_Popularity t_popularity = new T_Popularity()
                    {
                        id = popularity.Id,
                        viewed = Convert.ToByte(popularity.Viewed),
                        liked = Convert.ToByte(popularity.Liked),
                        article_id = popularity.ArticleId,
                        user_id = popularity.UserId
                    };
                    bdd.T_Popularity.Add(t_popularity);
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool DeletePopularity(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    bdd.T_Popularity.Remove(bdd.T_Popularity.Where(x => x.id == id).FirstOrDefault());
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool UpdatePopularity(DBO.Popularity popularity)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_Popularity t_popularity = bdd.T_Popularity.Where(x => x.id == popularity.Id).FirstOrDefault();
                    if (t_popularity != null)
                    {
                        t_popularity.id = popularity.Id;
                        t_popularity.viewed = Convert.ToByte(popularity.Viewed);
                        t_popularity.liked = Convert.ToByte(popularity.Liked);
                        t_popularity.article_id = popularity.ArticleId;
                        t_popularity.user_id = popularity.UserId;
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
        public static DBO.Popularity GetPopularity(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    var query = from popularity in bdd.T_Popularity
                                where popularity.id == id
                                select popularity;

                    if (query.Any())
                    {
                        return new DBO.Popularity()
                        {
                            Id = query.First().id,
                            Viewed = Convert.ToBoolean(query.First().viewed),
                            Liked = Convert.ToBoolean(query.First().liked),
                            ArticleId = query.First().article_id,
                            UserId = query.First().user_id
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

        public static List<DBO.Popularity> GetListPopularity()
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    List<DBO.Popularity> listPopularitys = new List<DBO.Popularity>();

                    var query = from popularity in bdd.T_Popularity
                                select popularity;

                    foreach (var element in query)
                    {
                        listPopularitys.Add(new DBO.Popularity()
                        {
                            Id = element.id,
                            Viewed = Convert.ToBoolean(element.viewed),
                            Liked = Convert.ToBoolean(element.liked),
                            ArticleId = element.article_id,
                            UserId = element.user_id
                        });
                    }
                    return listPopularitys;
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }
    }
}