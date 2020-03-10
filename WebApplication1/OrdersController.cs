using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Contracts;

namespace WebApplication1
{
    public  class OrdersController: BaseController
    {
        IOrdersService ordersService;
        public OrdersController(IOrdersService ordersService) {
            this.ordersService = ordersService;
        }
        public object GetData() {
            return ordersService.GetData();
        }
    }
}