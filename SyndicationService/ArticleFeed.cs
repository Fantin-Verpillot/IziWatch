using System.Collections.Generic;
using System.ServiceModel.Syndication;
using System.ServiceModel.Web;
using DBO = IziWatch.DBO;
using System.Xml.Linq;
using System;
using System.Xml;
using System.ServiceModel;

namespace SyndicationService
{
    // http://localhost:8733/Design_Time_Addresses/SyndicationService/Feed1/
    public class ArticleFeed : IArticleFeed
    {
        public SyndicationFeedFormatter CreateFeed()
        {
            SyndicationFeed feed = new SyndicationFeed("Flux articles", "Flux RSS fournissant les différents articles d'IziWatch", null);
            List<SyndicationItem> items = new List<SyndicationItem>();
            RssDataServiceReference.RssDataServiceClient rssDataService = new RssDataServiceReference.RssDataServiceClient();
            List<DBO.RssArticle> rssArticles = new List<DBO.RssArticle>(rssDataService.GetListRssArticle());
            foreach (DBO.RssArticle rssArticle in rssArticles) {
                SyndicationItem item = new SyndicationItem
                    (
                        rssArticle.Title,
                        rssArticle.Text,
                        new Uri("http://localhost:63166/Article/Details/" + rssArticle.Id),
                        rssArticle.Id.ToString(),
                        rssArticle.Date
                    );
                item.Categories.Add(new SyndicationCategory(rssArticle.CategoryName));

                item.ElementExtensions.Add(new XElement("view", new XText(rssArticle.Views.ToString())));
                item.ElementExtensions.Add(new XElement("like", new XText(rssArticle.Likes.ToString())));
                item.ElementExtensions.Add(new XElement("comment", new XText(rssArticle.Comments.ToString())));
                item.ElementExtensions.Add(new XElement("image", new XText(rssArticle.Image)));
                items.Add(item);
            }
            feed.Items = items;

            string query = WebOperationContext.Current.IncomingRequest.UriTemplateMatch.QueryParameters["format"];
            SyndicationFeedFormatter formatter = null;
            if (query == "atom")
            {
                formatter = new Atom10FeedFormatter(feed);
            }
            else
            {
                formatter = new Rss20FeedFormatter(feed);
            }

            return formatter;
        }
    }
}
