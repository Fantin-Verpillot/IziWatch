using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class User
    {
        public static bool CreateUser(DBO.User user)
        {
            return DataAccess.User.CreateUser(user);
        }

        public static bool DeleteUser(long id)
        {
            return DataAccess.User.DeleteUser(id);
        }

        public static bool UpdateUser(DBO.User user)
        {
            return DataAccess.User.UpdateUser(user);
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