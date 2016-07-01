using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class TwitterSocialArticle
    {
        public static List<DBO.TwitterSocialArticle> getTweets(DBO.Social soc)
        {
            return DataAccess.TwitterSocialArticle.getTweets(soc);
        }

        public static void TweetsToArticles(DBO.Social soc, List<DBO.TwitterSocialArticle> list)
        {
            DataAccess.TwitterSocialArticle.TweetsToArticles(soc, list);
        }

        public static bool ExecuteRequest(DBO.Social soc)
        {
            return DataAccess.TwitterSocialArticle.ExecuteRequest(soc);
        }

        public static bool ExecuteSeveralRequest(List<DBO.Social> list)
        {
            foreach (DBO.Social soc in list)
            {
                if (!TwitterSocialArticle.ExecuteRequest(soc))
                    return false;
            }
            return true;
        }

    }
}