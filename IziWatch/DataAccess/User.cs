using System;
using System.Collections.Generic;
using System.Linq;

namespace IziWatch.DataAccess
{
    public class User
    {
        public static bool CreateUser(DBO.User user)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_User t_user = new T_User()
                    {
                        id = user.Id,
                        login = user.Login,
                        password = user.Password,
                        email = user.Email,
                        role = user.Role
                    };
                    bdd.T_User.Add(t_user);
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool DeleteUser(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    bdd.T_User.Remove(bdd.T_User.Where(x => x.id == id).FirstOrDefault());
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool UpdateUser(DBO.User user)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_User t_user = bdd.T_User.Where(x => x.id == user.Id).FirstOrDefault();
                    if (t_user != null)
                    {
                        t_user.id = user.Id;
                        t_user.login = user.Login;
                        t_user.password = user.Password;
                        t_user.email = user.Email;
                        t_user.role = user.Role;
                        bdd.SaveChanges();
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }
        public static DBO.User GetUser(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    var query = from user in bdd.T_User
                                where user.id == id
                                select user;

                    if (query.Any())
                    {
                        return new DBO.User()
                        {
                            Id = query.First().id,
                            Login = query.First().login,
                            Password = query.First().password,
                            Email = query.First().email,
                            Role = query.First().role
                        };
                    }
                    else
                    {
                        return null;
                    }
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }

        public static DBO.User GetUser(String login, String password)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    var query = from user in bdd.T_User
                                where user.login == login && user.password == password
                                select user;

                    if (query.Any())
                    {
                        return new DBO.User()
                        {
                            Id = query.First().id,
                            Login = query.First().login,
                            Password = query.First().password,
                            Email = query.First().email,
                            Role = query.First().role
                        };
                    }
                    else
                    {
                        return null;
                    }
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }

        public static List<DBO.User> GetListUser()
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    List<DBO.User> listUsers = new List<DBO.User>();

                    var query = from user in bdd.T_User
                                select user;

                    foreach (var element in query)
                    {
                        listUsers.Add(new DBO.User()
                        {
                            Id = element.id,
                            Login = element.login,
                            Password = element.password,
                            Email = element.email,
                            Role = element.role
                        });
                    }
                    return listUsers;
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }
    }
}