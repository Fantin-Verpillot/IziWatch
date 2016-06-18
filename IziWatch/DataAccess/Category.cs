using System;
using System.Collections.Generic;
using System.Linq;

namespace IziWatch.DataAccess
{
    public class Category
    {
        public static bool CreateCategory(DBO.Category category)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_Category t_category = new T_Category()
                    {
                        id = category.Id,
                        name = category.Name
                    };
                    bdd.T_Category.Add(t_category);
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool DeleteCategory(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    bdd.T_Category.Remove(bdd.T_Category.Where(x => x.id == id).FirstOrDefault());
                    bdd.SaveChanges();
                    return true;
                }
                catch (Exception e)
                {
                    return false;
                }
            }
        }

        public static bool UpdateCategory(DBO.Category category)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    T_Category t_category = bdd.T_Category.Where(x => x.id == category.Id).FirstOrDefault();
                    if (t_category != null)
                    {
                        t_category.id = category.Id;
                        t_category.name = category.Name;
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
        public static DBO.Category GetCategory(long id)
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    var query = from category in bdd.T_Category
                                where category.id == id
                                select category;

                    if (query.Any())
                    {
                        return new DBO.Category()
                        {
                            Id = query.First().id,
                            Name = query.First().name
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

        public static List<DBO.Category> GetListCategory()
        {
            using (IziWatchEntities bdd = new IziWatchEntities())
            {
                try
                {
                    List<DBO.Category> listCategories = new List<DBO.Category>();

                    var query = from category in bdd.T_Category
                                select category;

                    foreach (var element in query)
                    {
                        listCategories.Add(new DBO.Category()
                        {
                            Id = element.id,
                            Name = element.name
                        });
                    }
                    return listCategories;
                }
                catch (Exception e)
                {
                    return null;
                }
            }
        }
    }
}