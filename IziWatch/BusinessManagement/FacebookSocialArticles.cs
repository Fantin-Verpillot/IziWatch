using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class FacebookSocialArticles
    {
        public static string CreateRequest(DBO.Social s, string access_token)
        {
            return DataAccess.FacebookSocialArticles.CreateRequest(s, access_token);
        }

        public static DBO.FacebookSocialArticles MakeRequest(string requestUrl)
        {
            return DataAccess.FacebookSocialArticles.MakeRequest(requestUrl);
        }

        static public void ProcessResponse(DBO.Social s, DBO.FacebookSocialArticles Response)
        {
            DataAccess.FacebookSocialArticles.ProcessResponse(s, Response);
        }

        static public bool ExecuteRequest(DBO.Social s, string access_token)
        {
            return DataAccess.FacebookSocialArticles.ExecuteRequest(s, access_token);
        }

        static public bool ExecuteSeveralRequest(List<DBO.Social> list, string access_token)
        {
            foreach (DBO.Social s in list)
            {
                if (!DataAccess.FacebookSocialArticles.ExecuteRequest(s, access_token))
                    return false;
            }
            return true;
        }
    }
}