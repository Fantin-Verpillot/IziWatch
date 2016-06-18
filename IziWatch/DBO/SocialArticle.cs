using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.DBO
{
    public class SocialArticle
    {
        public int Id { get; set; }
        public int ArticleId { get; set; }
        public int SocialId { get; set; }
    }
}