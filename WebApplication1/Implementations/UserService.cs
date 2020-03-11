using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Contracts;

namespace WebApplication1.Implementations
{
    public class UserService : IUserService
    {
        public UserService()
        {

        }

        public string GetUsers()
        {
            return "users";
        }
    }
}