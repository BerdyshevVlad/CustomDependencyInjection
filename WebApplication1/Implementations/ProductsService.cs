using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApplication1.Contracts
{
    public class ProductsService: IProductsService
    {
        public ProductsService(IRepository repository) { 
        }

        public object GetProducts()
        {
            return "products";
        }
    }
}
