using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class Popularity
    {
        public static bool CreatePopularity(DBO.Popularity popularity)
        {
            return DataAccess.Popularity.CreatePopularity(popularity);
        }

        public static bool DeletePopularity(long id)
        {
            return DataAccess.Popularity.DeletePopularity(id);
        }

        public static bool UpdatePopularity(DBO.Popularity popularity)
        {
            return DataAccess.Popularity.UpdatePopularity(popularity);
        }

        public static DBO.Popularity GetPopularity(long id)
        {
            return DataAccess.Popularity.GetPopularity(id);
        }

        public static List<DBO.Popularity> GetListPopularity()
        {
            return DataAccess.Popularity.GetListPopularity();
        }
    }
}