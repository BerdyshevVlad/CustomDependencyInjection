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

            var route = context.Request.QueryString["controller"];
            var controller = MyRouteManager.Routes[route];
            var action = context.Request.QueryString["action"];

            Type controllerType = Type.GetType($"WebApplication1.{controller}Controller", false, false);

            var ctorControllerParameters = controllerType
            .GetConstructors()
            .FirstOrDefault(c => c.GetParameters().Length > 0).GetParameters();

            var serviceRealization = GetRealization(ctorControllerParameters);


            var ctorServiceParameters = serviceRealization
                .Where(x => x.GetConstructors().FirstOrDefault(c => c.GetParameters().Length > 0)?.GetParameters() != null)
                .SelectMany(x => x.GetConstructors().FirstOrDefault(c => c.GetParameters().Length > 0)?.GetParameters()).ToArray();

            List<object> serviceInstances = new List<object>();
            foreach (var realization in serviceRealization)
            {
                var ctorServiceParams = realization
                    .GetConstructors()
                    .FirstOrDefault(c => c.GetParameters().Length > 0)?.GetParameters();

                List<object> repositories = new List<object>();
                if (ctorServiceParams != null)
                {
                    var repositoriesRealization = GetRealization(ctorServiceParams);
                    foreach (var repositoryRealization in repositoriesRealization)
                    {
                        repositories.Add(Activator.CreateInstance(repositoryRealization));
                    }
                }

                serviceInstances.Add(Activator.CreateInstance(realization, repositories?.ToArray()));
            }

            var controllerInstance = Activator.CreateInstance(controllerType, serviceInstances.ToArray());

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

        public List<Type> GetRealization(ParameterInfo[] parameters)
        {
            List<Type> realizations = new List<Type>();
            foreach (var parameter in parameters)
            {
                var serviceType = parameter.ParameterType;

                realizations.Add(DiManager.Injections[serviceType]);
            }

            return realizations;
        }
    }
}