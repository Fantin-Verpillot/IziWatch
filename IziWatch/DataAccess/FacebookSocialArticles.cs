using IziWatch.DBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Web;

namespace IziWatch.DataAccess
{
    public class FacebookSocialArticles
    {

        public static string CreateRequest(string page_id, string access_token)
        {
            string UrlRequest = " https://graph.facebook.com/" + page_id + "/feed?fields=message,picture,description,name&limit=10&access_token=" + access_token;
            return (UrlRequest);
        }


        public static DBO.FacebookSocialArticles MakeRequest(string requestUrl)
        {
            try
            {
                HttpWebRequest request = WebRequest.Create(requestUrl) as HttpWebRequest;
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    if (response.StatusCode != HttpStatusCode.OK)
                        throw new Exception(String.Format(
                        "Server error (HTTP {0}: {1}).",
                        response.StatusCode,
                        response.StatusDescription));
                    DataContractJsonSerializer jsonSerializer = new DataContractJsonSerializer(typeof(DBO.FacebookSocialArticles));
                    object objResponse = jsonSerializer.ReadObject(response.GetResponseStream());
                    DBO.FacebookSocialArticles jsonResponse
                    = objResponse as DBO.FacebookSocialArticles;
                    return jsonResponse;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return null;
            }
        }

        static public void ProcessResponse(DBO.FacebookSocialArticles Response)
        {
            Data[] data = Response.data;
            foreach (Data d in data)
            {
                DBO.SocialArticle sa = new DBO.SocialArticle { Text  = "name : " + d.name + "\n message : " + d.message,
                                                               Image = d.picture, SocialId = 1};

                BusinessManagement.SocialArticle.CreateSocialArticle(sa);
            }
        }

        static public void ExecuteRequest(string page_id, string access_token)
        {
            try
            {
                string Request = CreateRequest(page_id, access_token);
                DBO.FacebookSocialArticles Response = MakeRequest(Request);
                ProcessResponse(Response);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Console.Read();
            }
        }
    }
}