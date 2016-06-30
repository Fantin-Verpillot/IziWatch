using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class Popularity
    {
        public static DBO.Popularity GetPopularityByUserAndArticle(DBO.Article article, DBO.User user)
        {
            List<DBO.Popularity> popularities = BusinessManagement.Popularity.GetListPopularity();
            foreach (DBO.Popularity popularity in popularities)
            {
                if (popularity.UserId == user.Id && popularity.ArticleId == article.Id)
                {
                    return popularity;
                }
            }
            return null;
        }

        public static int countLikeArticle(DBO.Article article)
        {
            List<DBO.Popularity> popularities = BusinessManagement.Popularity.GetListPopularity();
            int countLikes = 0;
            foreach (DBO.Popularity popularity in popularities)
            {
                if (popularity.ArticleId == article.Id && popularity.Liked)
                {
                    ++countLikes;
                }
            }
            return countLikes;
        }

        public static bool CreatePopularity(DBO.Popularity popularity)
        {
            return DataAccess.Popularity.CreatePopularity(popularity);
        }

        public static bool DeletePopularity(long id)
        {
            return DataAccess.Popularity.DeletePopularity(id);
        }

        public static bool UpdatePopularity(DBO.Popularity popularity)
        {
            return DataAccess.Popularity.UpdatePopularity(popularity);
        }

        public static DBO.Popularity GetPopularity(long id)
        {
            return DataAccess.Popularity.GetPopularity(id);
        }

        public static List<DBO.Popularity> GetListPopularity()
        {
            return DataAccess.Popularity.GetListPopularity();
        }
    }
}