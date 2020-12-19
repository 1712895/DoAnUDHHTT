using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebDangKyXeMay.Startup))]
namespace WebDangKyXeMay
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
