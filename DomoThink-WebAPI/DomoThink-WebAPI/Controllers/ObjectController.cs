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
    [RoutePrefix("api/objects")]
    public class ObjectController : ApiController
    {
        [Route("getObjects")]
        [HttpGet]
        public Object GetObjects()
        {
            List<ObjectModel> _objects = new List<ObjectModel>();

            for (Int32 i = 0; i < 5; ++i)
                _objects.Add(new ObjectModel(i, "Object API #" + i.ToString()));

            return this.Ok(_objects);
        }

        [Route("getObject")]
        [HttpGet]
        public Object GetObject(Int32 id)
        {
            return this.Ok();
        }

        [Route("addObject")]
        [HttpPost]
        public Object AddObject(ObjectModel model)
        {
            return this.Ok();
        }

        [Route("updateObject")]
        [HttpPut]
        public Object UpdateObject(ObjectModel model)
        {
            return this.Ok();
        }

        [Route("deleteObject")]
        [HttpDelete]
        public Object DeleteObject(ObjectModel model)
        {
            return this.Ok();
        }
    }
}
