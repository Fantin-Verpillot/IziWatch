//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IziWatch.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class T_Comment
    {
        public int id { get; set; }
        public string title { get; set; }
        public string text { get; set; }
        public int article_id { get; set; }
        public int user_id { get; set; }
    
        public virtual T_Article T_Article { get; set; }
        public virtual T_User T_User { get; set; }
    }
}