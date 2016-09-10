using DAL.API;
using DAL.Model;
using DomoThink.Helper;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * ObjectService.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 15/04/2016 10:44:57
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.API
{
    public class ObjectService : ApiService
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

        public ObjectService(ApiClient api)
            : base(api)
        { }

        #endregion

        #region METHODS

        public async Task<List<ObjectModel>> GetObjects()
        {
            try
            {
                return await this.api.Get<List<ObjectModel>>("/api/" + ApiRoutes.GET_OBJECTS);
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return null;
            }
        }

        public async Task<List<ObjectModel>> GetNearObjects()
        {
            try
            {
                return await this.api.Get<List<ObjectModel>>("/api/" + ApiRoutes.GET_NEAR_OBJECTS);
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return null;
            }
        }

        public async Task<Boolean> DeleteObject(ObjectModel obj)
        {
            try
            {
                await this.api.Delete<ObjectModel>("/api/device/{0}", obj.Id);
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

        public async Task<Boolean> AddObject(ObjectModel obj)
        {
            try
            {
                await this.api.Post<ObjectModel, Object>("/api/device", obj);
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

        public async Task<Boolean> UpdateObject(ObjectModel obj)
        {
            try
            {
                await this.api.Put("/api/device/" + obj.Id.ToString(), obj);
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
