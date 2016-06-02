using DomoAPI.Client;
using DomoAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * PluginService.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 22/04/2016 12:17:18
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.API
{
    public class PluginService : ApiService
    {
        #region FIELDS



        #endregion

        #region PROPERTIES



        #endregion

        #region CONSTRUCTORS

        public PluginService(ApiClient client)
            : base(client)
        { }

        #endregion

        #region METHODS

        public async Task<List<PluginModel>> GetPlugins()
        {
            List<PluginModel> _plugins = await this.api.Get<List<PluginModel>>(ApiRoutes.GET_PLUGINS);

            // TODO: Checks

            return _plugins;
        }

        #endregion
    }
}
