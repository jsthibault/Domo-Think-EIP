using DomoThink_WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace DomoThink_WebAPI.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/account")]
    public class AccountController : ApiController
    {
        [Route("getAccounts")]
        public Object GetUsers()
        {
            List<AccountModel> _accounts = new List<AccountModel>();

            _accounts.Add(new AccountModel("Papa", "yolo"));
            _accounts.Add(new AccountModel("Maman", "yolo"));
            _accounts.Add(new AccountModel("Jean-Pierre", "yolo"));
            _accounts.Add(new AccountModel("Simone", "yolo"));
            _accounts.Add(new AccountModel("Le Chien", "yolo"));
            _accounts.Add(new AccountModel("Le Chat", "yolo"));
            _accounts.Add(new AccountModel("La Poule Domestique", "yolo"));

            return this.Ok(_accounts);
        }

        public Object GetUser(Int32 id)
        {
            return this.Ok();
        }

        public Object AddUser()
        {
            return this.Ok();
        }

        public Object UpdateUser()
        {
            return this.Ok();
        }

        public Object DeleteUser()
        {
            return this.Ok();
        }

    }
}
