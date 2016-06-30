using System;
using System.Collections.Generic;
using System.Linq;

namespace IziWatch.DataAccess
{
    public class Social
    {
        public static bool CreateSocial(DBO.Social social)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_Social t_social = new T_Social()
                    {
                        id = social.Id,
                        type = social.Type,
                        account = social.Account,
                        identifier = social.Identifier
                    };
                    bdd.T_Social.Add(t_social);
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool DeleteSocial(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    bdd.T_Social.Remove(bdd.T_Social.Where(x => x.id == id).FirstOrDefault());
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool UpdateSocial(DBO.Social social)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_Social t_social = bdd.T_Social.Where(x => x.id == social.Id).FirstOrDefault();
                    if (t_social != null)
                    {
                        t_social.id = social.Id;
                        t_social.type = social.Type;
                        t_social.account = social.Account;
                        t_social.identifier = social.Identifier;
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
        public static DBO.Social GetSocial(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    var query = from social in bdd.T_Social
                                where social.id == id
                                select social;

                    if (query.Any())
                    {
                        return new DBO.Social()
                        {
                            Id = query.First().id,
                            Type = query.First().type,
                            Account = query.First().account,
                            Identifier = query.First().identifier
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

        public static List<DBO.Social> GetListSocial()
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    List<DBO.Social> listSocials = new List<DBO.Social>();

                    var query = from social in bdd.T_Social
                                select social;

                    foreach (var element in query)
                    {
                        listSocials.Add(new DBO.Social()
                        {
                            Id = element.id,
                            Type = element.type,
                            Account = element.account,
                            Identifier = element.identifier
                        });
                    }
                    return listSocials;
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }
    }
}