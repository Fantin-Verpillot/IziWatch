﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class IziWatchEntities : DbContext
    {
        public IziWatchEntities()
            : base("name=IziWatchEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<T_Article> T_Article { get; set; }
        public virtual DbSet<T_Category> T_Category { get; set; }
        public virtual DbSet<T_Comment> T_Comment { get; set; }
        public virtual DbSet<T_Popularity> T_Popularity { get; set; }
        public virtual DbSet<T_Social> T_Social { get; set; }
        public virtual DbSet<T_User> T_User { get; set; }
        public virtual DbSet<T_SocialArticle> T_SocialArticle { get; set; }

        public System.Data.Entity.DbSet<IziWatch.DBO.SocialArticle> SocialArticles { get; set; }
    }
}
