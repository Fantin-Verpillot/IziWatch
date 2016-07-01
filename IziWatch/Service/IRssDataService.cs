using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace IziWatch.Service
{
    // REMARQUE : vous pouvez utiliser la commande Renommer du menu Refactoriser pour changer le nom d'interface "IRssDataService" à la fois dans le code et le fichier de configuration.
    [ServiceContract]
    public interface IRssDataService
    {
        [OperationContract]
        List<DBO.RssArticle> GetListRssArticle();
    }
}
