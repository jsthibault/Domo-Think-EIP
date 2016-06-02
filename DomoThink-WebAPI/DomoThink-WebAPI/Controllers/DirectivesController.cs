using DomoThink_WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DomoThink_WebAPI.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/directives")]
    public class DirectivesController : ApiController
    {
        [Route("getDirectives")]
        [HttpGet]
        public Object GetDirectives()
        {
            List<DirectiveModel> _objects = new List<DirectiveModel>();

            for (Int32 i = 0; i < 5; ++i)
                _objects.Add(new DirectiveModel(i, "Object API #" + i.ToString(), -1, -1, -1));

            return this.Ok(_objects);
        }

        [Route("getDirective")]
        [HttpGet]
        public Object GetDirective(Int32 id)
        {
            return this.Ok();
        }

        [Route("addDirective")]
        [HttpPost]
        public Object AddDirective(ObjectModel model)
        {
            return this.Ok();
        }

        [Route("updateDirective")]
        [HttpPut]
        public Object UpdateDirective(ObjectModel model)
        {
            return this.Ok();
        }

        [Route("deleteDirective")]
        [HttpDelete]
        public Object DeleteDirective(ObjectModel model)
        {
            return this.Ok();
        }
    }
}
