﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.DBO
{
    public class Article
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public int CategoryId { get; set; }
    }
}