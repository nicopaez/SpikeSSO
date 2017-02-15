using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ClassicWebsite.Startup))]
namespace ClassicWebsite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
