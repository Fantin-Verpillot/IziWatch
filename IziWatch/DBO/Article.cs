using System;

namespace IziWatch.DBO
{
    public class Article
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public int CategoryId { get; set; }
        public string Text { get; set; }
        public DateTime Date { get; set; }
    }
}