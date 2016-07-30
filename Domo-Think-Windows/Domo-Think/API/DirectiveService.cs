using DAL.API;
using DAL.Model;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * DirectiveService.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 14/04/2016 13:24:27
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.API
{
    public class DirectiveService : ApiService
    {
        #region CONSTANTS



        #endregion

        #region ENUMS



        #endregion

        #region FIELDS



        #endregion

        #region PROPERTIES



        #endregion

        #region CONSTRUCTORS

        public DirectiveService(ApiClient api)
            : base(api)
        { }

        #endregion

        #region METHODS

        public async Task<List<DirectiveModel>> GetDirectives()
        {
            try
            {
                return await this.api.Get<List<DirectiveModel>>("/api/" + ApiRoutes.GET_DIRECTIVES);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public async Task<Boolean> AddDirective(DirectiveModel model)
        {
            await this.api.Post<DirectiveModel, Object>("/api/directive", model);

            return true;
        }

        public async Task<Boolean> UpdateDirective(DirectiveModel model)
        {
            await this.api.Put<DirectiveModel>("/api/directive/" + model.Id, model);

            return true;
        }

        public async Task<Boolean> DeleteDirective(DirectiveModel directive)
        {
            await this.api.Delete<DirectiveModel>("/api/directive/{0}", directive.Id);

            return true;
        }

        #endregion
    }
}
