using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class Comment
    {
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