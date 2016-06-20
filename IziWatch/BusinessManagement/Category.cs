using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class Category
    {
        public static bool CreateCategory(DBO.Category category)
        {
            return DataAccess.Category.CreateCategory(category);
        }

        public static bool DeleteCategory(long id)
        {
            return DataAccess.Category.DeleteCategory(id);
        }

        public static bool UpdateCategory(DBO.Category category)
        {
            return DataAccess.Category.UpdateCategory(category);
        }

        public static DBO.Category GetCategory(long id)
        {
            return DataAccess.Category.GetCategory(id);
        }

        public static List<DBO.Category> GetListCategory()
        {
            return DataAccess.Category.GetListCategory();
        }
    }
}