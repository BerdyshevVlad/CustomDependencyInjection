using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Start
{

    public class MyRouteManager
    {
        public static Dictionary<string, string> Routes = new Dictionary<string, string>();

        public static void RegisterRoutes() {
            Routes.Add("Home", "Index");
            Routes.Add("Order", "Orders");
        }
    }
}