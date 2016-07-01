using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.DBO
{
    public class RssArticle
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public string CategoryName { get; set; }
        public string Text { get; set; }
        public DateTime Date { get; set; }
        public int Views { get; set; }
        public int Likes { get; set; }
        public int Comments { get; set; }
    }
}