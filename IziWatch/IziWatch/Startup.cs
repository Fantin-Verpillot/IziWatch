using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IziWatch.Startup))]
namespace IziWatch
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
