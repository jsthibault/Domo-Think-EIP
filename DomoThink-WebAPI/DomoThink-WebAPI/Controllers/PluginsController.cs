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
    [RoutePrefix("api/plugins")]
    public class PluginsController : ApiController
    {
        [Route("getPlugins")]
        public Object GetPlugins()
        {
            List<PluginModel> _objects = new List<PluginModel>();

            for (Int32 i = 0; i < 5; ++i)
                _objects.Add(new PluginModel(i, "Plugin API #" + i.ToString(), 4, false));

            return this.Ok(_objects);
        }
    }
}
