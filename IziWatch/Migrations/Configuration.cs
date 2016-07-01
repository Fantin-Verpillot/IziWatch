using System;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using IziWatch.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace IziWatch.Migrations
{


    internal sealed class Configuration : DbMigrationsConfiguration<IziWatch.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(IziWatch.Models.ApplicationDbContext context)
        {
            /*var manager = new UserManager<ApplicationUser>(
            new UserStore<ApplicationUser>(
            new ApplicationDbContext()));
            var user = new ApplicationUser()
            {
                UserName = "admin",
                // Add the following so our Seed data is complete:
                Email = "admin@epita.fr",
            };
            manager.Create(user, "admin123*");*/
        }
    
        
    }
}
