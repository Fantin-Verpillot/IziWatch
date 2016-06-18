using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.DBO
{
    public class Popularity
    {
        public int Id { get; set; }
        public bool Viewed { get; set; }
        public bool Liked { get; set; }
        public int ArticleId { get; set; }
        public int UserId { get; set; }
    }
}