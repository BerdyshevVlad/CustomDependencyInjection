using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using WebApplication1.Contracts;
using WebApplication1.DI;
using WebApplication1.Start;

namespace WebApplication1
{
    /// <summary>
    /// Summary description for HandlerMVC
    /// </summary>
    public class HandlerMVC : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            var queryString = context.Request.QueryString;
            string controller = string.Empty;
            string action = string.Empty;
            foreach (string key in queryString.AllKeys)
            {
                if (key == "controller")
                {
                    var route = context.Request.QueryString[key];
                    controller = MyRouteManager.Routes[route];


                }
                if (key == "action")
                {
                    action = context.Request.QueryString[key];
                }
            }

            Type controllerType = Type.GetType($"WebApplication1.{controller}Controller", false, false);

            var ctorControllerParameters = controllerType
            .GetConstructors()
            .FirstOrDefault(c => c.GetParameters().Length > 0).GetParameters();

            Type serviceType = null;
            object serviceInstance = null;
            Type serviceRealization = null;
            foreach (var parameter in ctorControllerParameters)
            {
                serviceType = parameter.ParameterType;

                serviceRealization = DiManager.Injections[serviceType];
            }

            var ctorServiceParameters = serviceRealization
                    .GetConstructors()
                    .FirstOrDefault(c => c.GetParameters().Length > 0).GetParameters();

            object repositoryInstance = null;
            foreach (var parameter in ctorServiceParameters)
            {
                var repositoryType = parameter.ParameterType;

                var realization = DiManager.Injections[repositoryType];
                repositoryInstance = Activator.CreateInstance(realization);
            }

            serviceInstance = Activator.CreateInstance(serviceRealization, new object[] { repositoryInstance });
            var controllerInstance = Activator.CreateInstance(controllerType, new object[] { serviceInstance });

            var method = controllerType.GetMethod(action);
            var result = method.Invoke(controllerInstance, null);


            //context.Request.QueryString;
            //
            //object result = new IndexController( new ProductsService(new Repository()))
            //    .Index();
            context.Response.Write(result);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}