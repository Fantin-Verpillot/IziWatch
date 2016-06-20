using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class SocialArticle
    {
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