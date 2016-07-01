using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class Comment
    {
        public static int countCommentArticle(DBO.Article article)
        {
            List<DBO.Comment> comments = BusinessManagement.Comment.GetListComment();
            int countComments = 0;
            foreach (DBO.Comment comment in comments)
            {
                if (comment.ArticleId == article.Id)
                {
                    ++countComments;
                }
            }
            return countComments;
        }

        public static List<DBO.Comment> GetCommentsByArticle(DBO.Article article)
        {
            List<DBO.Comment> comments = DataAccess.Comment.GetListComment();
            List<DBO.Comment> formatedComments = new List<DBO.Comment>();
            foreach (DBO.Comment comment in comments)
            {
                if (comment.ArticleId == article.Id)
                {
                    formatedComments.Add(comment);
                }
            }
            return formatedComments;
        }

        public static bool CreateComment(DBO.Comment comment)
        {
            return DataAccess.Comment.CreateComment(comment);
        }

        public static bool DeleteComment(long id)
        {
            return DataAccess.Comment.DeleteComment(id);
        }

        public static bool UpdateComment(DBO.Comment comment)
        {
            return DataAccess.Comment.UpdateComment(comment);
        }

        public static DBO.Comment GetComment(long id)
        {
            return DataAccess.Comment.GetComment(id);
        }

        public static List<DBO.Comment> GetListComment()
        {
            return DataAccess.Comment.GetListComment();
        }
    }
}