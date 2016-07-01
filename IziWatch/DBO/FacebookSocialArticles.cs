using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace IziWatch.DBO
{
    [DataContract]
    public class FacebookSocialArticles
    {

        [DataMember(Name = "data")]
        public Data[] data { get; set; }

    }

    [DataContract]
    public class Data
    {

        [DataMember(Name = "message")]
        public string message { get; set; }

        [DataMember(Name = "picture")]
        public string picture { get; set; }

        [DataMember(Name = "description")]
        public string description { get; set; }

        [DataMember(Name = "name")]
        public string name { get; set; }
    }
}