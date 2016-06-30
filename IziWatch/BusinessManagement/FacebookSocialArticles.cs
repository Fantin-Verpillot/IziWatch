using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class FacebookSocialArticles
    {
        public static string CreateRequest(string page_id, string access_token)
        {
            return DataAccess.FacebookSocialArticles.CreateRequest(page_id, access_token);
        }

        public static DBO.FacebookSocialArticles MakeRequest(string requestUrl)
        {
            return DataAccess.FacebookSocialArticles.MakeRequest(requestUrl);
        }

        static public void ProcessResponse(DBO.FacebookSocialArticles Response)
        {
            DataAccess.FacebookSocialArticles.ProcessResponse(Response);
        }

        static public void ExecuteRequest(string page_id, string access_token)
        {
            DataAccess.FacebookSocialArticles.ExecuteRequest(page_id, access_token);
        }
    }
}