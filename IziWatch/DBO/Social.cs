using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IziWatch.DBO
{
    public class Social
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public string Account { get; set; }
        public string Identifier { get; set; }
    }
}