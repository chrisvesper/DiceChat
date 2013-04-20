using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.SignalR;

[assembly: PreApplicationStartMethod(typeof(DiceChatStart.RegisterHubs), "Start")]

namespace DiceChatStart
{
    public static class RegisterHubs
    {
        public static void Start()
        {
            var config = new HubConfiguration
            {
                EnableCrossDomain = true
            };

            RouteTable.Routes.MapHubs(config);
        }
    }
}
