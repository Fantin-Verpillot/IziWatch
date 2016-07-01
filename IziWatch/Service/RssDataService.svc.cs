using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace IziWatch.Service
{
    // REMARQUE : vous pouvez utiliser la commande Renommer du menu Refactoriser pour changer le nom de classe "RssDataService" à la fois dans le code, le fichier svc et le fichier de configuration.
    // REMARQUE : pour lancer le client test WCF afin de tester ce service, sélectionnez RssDataService.svc ou RssDataService.svc.cs dans l'Explorateur de solutions et démarrez le débogage.
    public class RssDataService : IRssDataService
    {
        public List<DBO.RssArticle> GetListRssArticle()
        {
            List<DBO.RssArticle> rssArticles = new List<DBO.RssArticle>();
            DBO.RssArticle rssArticle;
            List<DBO.Article> articles = BusinessManagement.Article.GetListArticle();

            foreach (DBO.Article article in articles)
            {
                rssArticle = new DBO.RssArticle();
                rssArticle.Id = article.Id;
                rssArticle.Title = article.Title;
                rssArticle.Text = article.Text;
                rssArticle.Image = article.Image;
                rssArticle.CategoryName = BusinessManagement.Category.GetCategory(article.CategoryId).Name;
                rssArticle.Date = article.Date;
                rssArticle.Views = article.Views;
                rssArticle.Likes = BusinessManagement.Popularity.countLikeArticle(article);
                rssArticle.Comments = BusinessManagement.Comment.countCommentArticle(article);
                
                rssArticles.Add(rssArticle);
            }
            return rssArticles;
        }
    }
}
