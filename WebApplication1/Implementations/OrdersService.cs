using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApplication1.Contracts
{
    public class OrdersService: IOrdersService
    {
        public OrdersService(IRepository repository)
        {
        }

        public object GetData()
        {
            return "data";
        }
    }
}
