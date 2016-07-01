using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Syndication;
using System.ServiceModel.Web;
using System.Text;

namespace IWSyndicationService
{
    // REMARQUE : vous pouvez utiliser la commande Renommer du menu Refactoriser pour changer le nom de classe "Feed1" à la fois dans le code et le fichier de configuration.
    public class Feed1 : IFeed1
    {
        public SyndicationFeedFormatter CreateFeed()
        {
            // Créez un flux RSS.
            SyndicationFeed feed = new SyndicationFeed("Feed Title", "A WCF Syndication Feed", null);
            List<SyndicationItem> items = new List<SyndicationItem>();

            // Créez un article RSS.
            SyndicationItem item = new SyndicationItem("An item", "Item content", null);
            items.Add(item);
            feed.Items = items;

            // Renvoie ATOM ou RSS en fonction de la chaîne de requête
            // rss -> http://localhost:8733/Design_Time_Addresses/IWSyndicationService/Feed1/
            // atom -> http://localhost:8733/Design_Time_Addresses/IWSyndicationService/Feed1/?format=atom
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
