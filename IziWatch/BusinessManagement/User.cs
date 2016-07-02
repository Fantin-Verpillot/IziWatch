using System;
using System.Collections.Generic;
using IziWatch.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace IziWatch.BusinessManagement
{
    public class User
    {
        public static DBO.User GetUserByUserIdentity(String login)
        {
            return GetUserByLogin(login);
        }

        public static DBO.User GetUserByLogin(String login)
        {
            List<DBO.User> users = GetListUser();
            foreach (DBO.User user in users)
            {
                if (user.Login == login)
                {
                    return user;
                }
            }
            return null;
        }

        public static DBO.User GetUserByMaxId()
        {
            List<DBO.User> users = GetListUser();
            users.Sort((x, y) => x.Id.CompareTo(y.Id));
            return users[users.Count - 1];
        }

        public static bool CreateUserIdentityFromUser(DBO.User user)
        {
            ApplicationDbContext context = new ApplicationDbContext();
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            String roleString = user.Role == 0 ? "Root" : user.Role == 1 ? "Admin" : "User";
            var role = new IdentityRole();
            role.Name = roleString;
            roleManager.Create(role);

            var userIdentity = new ApplicationUser
            {
                UserName = user.Login,
                Email = user.Email
            };
            var result = UserManager.Create(userIdentity, user.Password);
            if (result.Succeeded)
            {
                UserManager.AddToRole(userIdentity.Id, roleString);
                return true;
            }
            return false;
        }

        public static bool UpdateUserIdentityFromUser(DBO.User user)
        {
            DBO.User oldUser = BusinessManagement.User.GetUser(user.Id);
            string oldPassword = oldUser.Password;
            string oldLogin = oldUser.Login;
            ApplicationDbContext context = new ApplicationDbContext();
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            String roleString = user.Role == 0 ? "Root" : user.Role == 1 ? "Admin" : "User";
            var role = new IdentityRole();
            role.Name = roleString;
            roleManager.Create(role);

            var userIdentity = UserManager.FindByName(oldLogin);
            userIdentity.UserName = user.Login;
            userIdentity.Email = user.Email;
            UserManager.ChangePassword(userIdentity.Id, oldPassword, user.Password);
            var result = UserManager.Update(userIdentity);

            if (result.Succeeded)
            {
                IList<String> identityRoles = UserManager.GetRoles(userIdentity.Id);
                string[] roleStrings = new string[3];
                int i = 0;
                foreach (String identityRole in identityRoles)
                {
                    roleStrings[i] = identityRole;
                }
                UserManager.RemoveFromRoles(userIdentity.Id, roleStrings);
                UserManager.AddToRole(userIdentity.Id, roleString);
                return true;
            }
            return false;
        }

        public static bool DeleteIdentityFromUser(DBO.User user)
        {
            ApplicationDbContext context = new ApplicationDbContext();
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var userIdentity = UserManager.FindByName(user.Login);
            var result = UserManager.Delete(userIdentity);
            return result.Succeeded;
        }

        public static bool CreateUser(DBO.User user)
        {
            bool res = DataAccess.User.CreateUser(user);
            if (res)
            {
                DBO.User newUser = GetUserByMaxId();
                List<DBO.Article> articles = BusinessManagement.Article.GetListArticle();
                DBO.Popularity popularity;
                foreach (DBO.Article article in articles)
                {
                    popularity = new DBO.Popularity();
                    popularity.Liked = false;
                    popularity.Viewed = false;
                    popularity.ArticleId = article.Id;
                    popularity.UserId = newUser.Id;
                    BusinessManagement.Popularity.CreatePopularity(popularity);
                }
                CreateUserIdentityFromUser(user);
                return true;
            }
            return false;
        }

        public static bool DeleteUser(long id)
        {
            bool res = DeleteIdentityFromUser(GetUser(id));
            if (res)
            {
                return DataAccess.User.DeleteUser(id);
            }
            return false;
        }

        public static bool UpdateUser(DBO.User user)
        {
            bool res = UpdateUserIdentityFromUser(user);
            if (res)
            {
                return DataAccess.User.UpdateUser(user);
            }
            return false;
        }

        public static DBO.User GetUser(long id)
        {
            return DataAccess.User.GetUser(id);
        }

        public static List<DBO.User> GetListUser()
        {
            return DataAccess.User.GetListUser();
        }
    }
}