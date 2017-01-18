using DAL.API;
using DAL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomoThink.API
{
    public class BoxService : ApiService
    {
        public BoxService(ApiClient client) : base(client)
        {
        }

        public async Task<BoxStatusModel> GetStatus()
        {
            try
            {
                return await this.api.Get<BoxStatusModel>("/box/status");
            }
            catch (Exception e)
            {
            }

            return new BoxStatusModel();
        }
    }
}
