using DAL.API;
using DAL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomoThink.API
{
    public class StoreService : ApiService
    {
        public StoreService(ApiClient client) : base(client)
        {
        }

        public async Task<IEnumerable<PluginModel>> GetPlugins()
        {
            return await this.api.Get<IEnumerable<PluginModel>>(ApiRoutes.GET_PLUGINS_STORE);
        }

        public void GetPluginById(int id)
        {
        }

        public async Task<IEnumerable<PluginComment>> GetPluginComments(int pluginId)
        {
            return await this.api.Get<IEnumerable<PluginComment>>(ApiRoutes.GET_PLUGINS_STORE_COMMENTS, pluginId);
        }

        public async Task PostComment(PluginComment comment)
        {
            string url = string.Format(ApiRoutes.POST_PLUGINS_STORE_COMMENTS, comment.PluginId);

            await this.api.Post<PluginComment, object>(url, comment);
        }
    }
}
