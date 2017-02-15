using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using AuthenticationServer.App_Start;

[assembly: OwinStartup(typeof(AuthenticationServer.Startup))]

namespace AuthenticationServer
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            AuthConfig.Configure(app);
        }
    }
}
