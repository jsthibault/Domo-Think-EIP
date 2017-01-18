using DAL.API;
using DAL.Model;
using DomoThink.Helper;
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
                return await this.api.Get<List<DirectiveModel>>(ApiRoutes.DIRECTIVES);
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return null;
            }
        }

        public async Task<Boolean> AddDirective(DirectiveModel model)
        {
            try
            {
                await this.api.Post<DirectiveModel, Object>(ApiRoutes.DIRECTIVES, model);
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

        public async Task<Boolean> UpdateDirective(DirectiveModel model)
        {
            try
            {
                await this.api.Put(ApiRoutes.DIRECTIVES, model);
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

        public async Task<Boolean> DeleteDirective(DirectiveModel directive)
        {
            try
            {
                await this.api.Delete<DirectiveModel>(ApiRoutes.DIRECTIVES_ID, directive.Id);
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

        #endregion
    }
}
