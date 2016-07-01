using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.BusinessManagement
{
    public class Social
    {
        public static List<DBO.Social> GetSocialsByType(String type)
        {
            List<DBO.Social> socials = new List<DBO.Social>();
            foreach (DBO.Social social in BusinessManagement.Social.GetListSocial())
            {
                if (social.Type == type)
                    socials.Add(social);
            }
            return socials;
        }

        public static bool CreateSocial(DBO.Social social)
        {
            return DataAccess.Social.CreateSocial(social);
        }

        public static bool DeleteSocial(long id)
        {
            return DataAccess.Social.DeleteSocial(id);
        }

        public static bool UpdateSocial(DBO.Social social)
        {
            return DataAccess.Social.UpdateSocial(social);
        }

        public static DBO.Social GetSocial(long id)
        {
            return DataAccess.Social.GetSocial(id);
        }

        public static List<DBO.Social> GetListSocial()
        {
            return DataAccess.Social.GetListSocial();
        }
    }
}