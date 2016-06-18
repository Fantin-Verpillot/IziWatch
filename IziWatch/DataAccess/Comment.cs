using System;
using System.Collections.Generic;
using System.Linq;

namespace IziWatch.DataAccess
{
    public class Comment
    {
        public static bool CreateComment(DBO.Comment comment)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_Comment t_comment = new T_Comment()
                    {
                        id = comment.Id,
                        title = comment.Title,
                        text = comment.Text,
                        article_id = comment.ArticleId,
                        user_id = comment.UserId
                    };
                    bdd.T_Comment.Add(t_comment);
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool DeleteComment(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    bdd.T_Comment.Remove(bdd.T_Comment.Where(x => x.id == id).FirstOrDefault());
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool UpdateComment(DBO.Comment comment)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_Comment t_comment = bdd.T_Comment.Where(x => x.id == comment.Id).FirstOrDefault();
                    if (t_comment != null)
                    {
                        t_comment.id = comment.Id;
                        t_comment.title = comment.Title;
                        t_comment.text = comment.Text;
                        t_comment.article_id = comment.ArticleId;
                        t_comment.user_id = comment.UserId;
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
        public static DBO.Comment GetComment(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    var query = from comment in bdd.T_Comment
                                where comment.id == id
                                select comment;

                    if (query.Any())
                    {
                        return new DBO.Comment()
                        {
                            Id = query.First().id,
                            Title = query.First().title,
                            Text = query.First().text,
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

        public static List<DBO.Comment> GetListComment()
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    List<DBO.Comment> listComments = new List<DBO.Comment>();

                    var query = from comment in bdd.T_Comment
                                select comment;

                    foreach (var element in query)
                    {
                        listComments.Add(new DBO.Comment()
                        {
                            Id = element.id,
                            Title = element.title,
                            Text = element.text,
                            ArticleId = element.article_id,
                            UserId = element.user_id
                        });
                    }
                    return listComments;
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }
    }
}