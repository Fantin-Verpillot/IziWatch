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
    
    public partial class T_Article
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public T_Article()
        {
            this.T_Comment = new HashSet<T_Comment>();
            this.T_Popularity = new HashSet<T_Popularity>();
            this.T_SocialArticle = new HashSet<T_SocialArticle>();
        }
    
        public int id { get; set; }
        public string title { get; set; }
        public string image { get; set; }
        public int category_id { get; set; }
    
        public virtual T_Category T_Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<T_Comment> T_Comment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<T_Popularity> T_Popularity { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<T_SocialArticle> T_SocialArticle { get; set; }
    }
}