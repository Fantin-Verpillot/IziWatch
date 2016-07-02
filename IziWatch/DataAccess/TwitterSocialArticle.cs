using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tweetinvi;

namespace IziWatch.DataAccess
{
    public class TwitterSocialArticle
    {
        private static string CONSUMER_KEY        = "qR3iClEDG0gWTjo6xzHla5Dc4";
        private static string CONSUMER_SECRET     = "yWWJBf5ZBC1tF1tAD1fakdN34Y3mKFi4vuAtT7lyhvt4BxsIwD";
        private static string ACCESS_TOKEN        = "748595817393446912-MBYuI7VLyw2k8IkFFJql1BwOWMOdxHR";
        private static string ACCESS_TOKEN_SECRET = "I5YU15ZrYVK83R2T4ijQN7bfxoktUXawRLfvZEZg5jF84";

        public static List<DBO.TwitterSocialArticle> getTweets(DBO.Social soc)
        {
            List<DBO.TwitterSocialArticle> list = new List<DBO.TwitterSocialArticle>(10);

            Auth.SetUserCredentials(CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET);

            Tweetinvi.Core.Interfaces.IUser user2 = Tweetinvi.User.GetUserFromScreenName("@" + soc.Account);

            var userTimelineParam = new Tweetinvi.Core.Parameters.UserTimelineParameters
            {
                MaximumNumberOfTweetsToRetrieve = 10,
                IncludeRTS = true
            };

            List<Tweetinvi.Core.Interfaces.ITweet> tweets2 = new List<Tweetinvi.Core.Interfaces.ITweet>();
            tweets2 = Timeline.GetUserTimeline(user2, userTimelineParam).ToList();

            foreach (Tweetinvi.Core.Interfaces.ITweet prime2 in tweets2)
            {
                DBO.TwitterSocialArticle tsa = new DBO.TwitterSocialArticle();
                tsa.text  = prime2.Text;
                if (prime2.Media.Any())
                    tsa.image = prime2.Media.First().MediaURL;
                else
                    tsa.image = "";
            
                list.Add(tsa);
            }
            
            return list;
        }

        public static void TweetsToArticles(DBO.Social soc, List<DBO.TwitterSocialArticle> list)
        {
            foreach (DBO.TwitterSocialArticle tsa in list)
            {
                DBO.SocialArticle sa = new DBO.SocialArticle();
                sa.Image             = tsa.image;
                sa.Text              = tsa.text;
                sa.SocialId          = soc.Id;

                BusinessManagement.SocialArticle.CreateSocialArticle(sa);
            }
        }


        public static bool ExecuteRequest(DBO.Social soc)
        {
            try
            {
                List<DBO.TwitterSocialArticle> tweets = getTweets(soc);
                TweetsToArticles(soc, tweets);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}