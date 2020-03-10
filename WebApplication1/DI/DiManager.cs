using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Contracts;

namespace WebApplication1.DI
{
    public class DiManager
    {
        public static Dictionary<Type, Type> Injections { get; set; } = new Dictionary<Type, Type>();

        public static void InitDependencies() {
            Injections.Add(typeof(IRepository), typeof(Repository));
            Injections.Add(typeof(IProductsService), typeof(ProductsService));
            Injections.Add(typeof(IOrdersService), typeof(OrdersService));
        }
    }
}