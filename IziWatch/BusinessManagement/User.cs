using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class User
    {
        public static DBO.User GetUserByMaxId()
        {
            List<DBO.User> users = GetListUser();
            users.Sort((x, y) => x.Id.CompareTo(y.Id));
            return users[users.Count - 1];
        }

        public static bool CreateUser(DBO.User user)
        {
            bool res = DataAccess.User.CreateUser(user);
            if (res)
            {
                DBO.User newUser = GetUserByMaxId();
                List<DBO.Article> articles = BusinessManagement.Article.GetListArticle();
                DBO.Popularity popularity;
                foreach (DBO.Article article in articles)
                {
                    popularity = new DBO.Popularity();
                    popularity.Liked = false;
                    popularity.Viewed = false;
                    popularity.ArticleId = article.Id;
                    popularity.UserId = newUser.Id;
                    BusinessManagement.Popularity.CreatePopularity(popularity);
                }
                return true;
            }
            return false;
        }

        public static bool DeleteUser(long id)
        {
            return DataAccess.User.DeleteUser(id);
        }

        public static bool UpdateUser(DBO.User user)
        {
            return DataAccess.User.UpdateUser(user);
        }

        public static DBO.User GetUser(long id)
        {
            return DataAccess.User.GetUser(id);
        }

        public static List<DBO.User> GetListUser()
        {
            return DataAccess.User.GetListUser();
        }
    }
}