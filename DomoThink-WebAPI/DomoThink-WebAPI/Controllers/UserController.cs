using DomoThink_WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DomoThink_WebAPI.Controllers
{
    [RoutePrefix("api/user")]
    [AllowAnonymous]
    public class UserController : ApiController
    {
        [Route("auth")]
        [HttpPost]
        public Object UserLogin(LoginModel model)
        {
            LoginResponse _resposne = new LoginResponse();

            _resposne.Token = "fsdjfinHBEFNUnjI";
            if (model.Id == "user" && model.Password == "test")
                return this.Ok(_resposne);

            return this.InternalServerError();
        }
    }
}
