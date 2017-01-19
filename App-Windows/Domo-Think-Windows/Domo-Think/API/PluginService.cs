using DAL.API;
using DAL.Model;
using DomoThink.Helper;
using System.Collections.Generic;
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
        public PluginService(ApiClient client)
            : base(client)
        { }
        
        public async Task<List<PluginModel>> GetPlugins()
        {
            try
            {
                List<PluginModel> _plugins = await this.api.Get<List<PluginModel>>(ApiRoutes.PLUGINS);

                // TODO: Checks

                return _plugins;
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return null;
            }
        }

        public async Task<bool> ChangeStatus(PluginModel model)
        {
            try
            {
                await this.api.Put(ApiRoutes.PLUGINS_CHANGE_STATUS, model);
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return false;
            }

            return true;
        }

        public async Task<bool> Remove(PluginModel model)
        {
            try
            {
                return await this.api.Delete<PluginModel>(ApiRoutes.PLUGINS_ID, model.Id) != null;
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return false;
            }
        }
    }
}
