using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class SocialArticle
    {
        public static void DeleteSocialArticlesByType(string type)
        {
            List<DBO.SocialArticle> socialArticles = BusinessManagement.SocialArticle.GetListSocialArticle();
            foreach (DBO.SocialArticle socialArticle in socialArticles)
            {
                if (type == BusinessManagement.Social.GetSocial(socialArticle.SocialId).Type)
                {
                    BusinessManagement.SocialArticle.DeleteSocialArticle(socialArticle.Id);
                }
            }
        }

        public static List<DBO.SocialArticle> GetSocialArticlesBySocialId(int socialId)
        {
            List<DBO.SocialArticle> resultSocial = new List<DBO.SocialArticle>();
            foreach (DBO.SocialArticle socialArticle in BusinessManagement.SocialArticle.GetListSocialArticle())
            {
                if (socialArticle.SocialId == socialId)
                {
                    resultSocial.Add(socialArticle);
                }
            }
            return resultSocial;
        }

        public static bool CreateSocialArticle(DBO.SocialArticle socialArticle)
        {
            return DataAccess.SocialArticle.CreateSocialArticle(socialArticle);
        }

        public static bool DeleteSocialArticle(long id)
        {
            return DataAccess.SocialArticle.DeleteSocialArticle(id);
        }

        public static bool UpdateSocialArticle(DBO.SocialArticle socialArticle)
        {
            return DataAccess.SocialArticle.UpdateSocialArticle(socialArticle);
        }

        public static DBO.SocialArticle GetSocialArticle(long id)
        {
            return DataAccess.SocialArticle.GetSocialArticle(id);
        }

        public static List<DBO.SocialArticle> GetListSocialArticle()
        {
            return DataAccess.SocialArticle.GetListSocialArticle();
        }
    }
}