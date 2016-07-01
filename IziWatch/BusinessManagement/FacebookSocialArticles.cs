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

        static public void ExecuteRequest(DBO.Social s, string access_token)
        {
            DataAccess.FacebookSocialArticles.ExecuteRequest(s, access_token);
        }

        static public void ExecuteSeveralRequest(List<DBO.Social> list, string access_token)
        {
            foreach (DBO.Social s in list)
            {   
                DataAccess.FacebookSocialArticles.ExecuteRequest(s, access_token);
            }
        }

        static public void ExecuteRequestTEST(DBO.Social s, string access_token)
        {
            s = BusinessManagement.Social.GetSocial(1);
            DataAccess.FacebookSocialArticles.ExecuteRequest(s, access_token);
        }
    }
}