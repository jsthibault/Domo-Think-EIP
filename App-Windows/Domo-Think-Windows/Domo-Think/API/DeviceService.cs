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
    public class DeviceService : ApiService
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

        public DeviceService(ApiClient api)
            : base(api)
        { }

        #endregion

        #region METHODS

        public async Task<List<DeviceModel>> GetDevices()
        {
            try
            {
                return await this.api.Get<List<DeviceModel>>(ApiRoutes.DEVICE_ROUTE);
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return null;
            }
        }

        public async Task<DeviceModel[]> ScanDevices()
        {
            try
            {
                return await this.api.Get<DeviceModel[]>(ApiRoutes.DEVICE_SCAN_ROUTE);
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return null;
            }
        }

        public async Task<DeviceModel> GetDeviceById(int id)
        {
            try
            {
                return await this.api.Get<DeviceModel>(ApiRoutes.DEVICE_ROUTE, new { id = id });
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));
                return null;
            }
        }

        public async Task<Boolean> AddDevice(DeviceModel obj)
        {
            try
            {
                await this.api.Post<DeviceModel, Object>(ApiRoutes.DEVICE_ROUTE, obj);
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

        public async Task<Boolean> UpdateDevice(DeviceModel model)
        {
            try
            {
                return await this.api.Put(ApiRoutes.DEVICE_ROUTE, model) != null;
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return false;
            }
        }

        public async Task<Boolean> RemoveDevice(DeviceModel model)
        {
            try
            {
                return await this.api.Delete<DeviceModel>(ApiRoutes.DEVICE_ROUTE_ID, model.Id) != null;
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return false;
            }
        }

        public async Task<List<DeviceModel>> GetNearObjects()
        {
            try
            {
                throw new NotImplementedException();
                //return await this.api.Get<List<ObjectModel>>("/api/" + ApiRoutes.GET_NEAR_OBJECTS);
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return null;
            }
        }

        #endregion
    }
}
