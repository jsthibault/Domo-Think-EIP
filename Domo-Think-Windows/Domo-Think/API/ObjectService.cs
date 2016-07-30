using DAL.API;
using DAL.Model;
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
            return await this.api.Get<List<ObjectModel>>("/api/" + ApiRoutes.GET_OBJECTS);
        }

        public async Task<Boolean> DeleteObject(ObjectModel obj)
        {
            await this.api.Delete<ObjectModel>("/api/device/{0}", obj.Id);

            return true;
        }

        public async Task<Boolean> AddObject(ObjectModel obj)
        {
            await this.api.Post<ObjectModel, Object>("/api/device", obj);

            return true;
        }

        public async Task<Boolean> UpdateObject(ObjectModel obj)
        {
            await this.api.Put<ObjectModel>("/api/device/" + obj.Id.ToString(), obj);

            return true;
        }

        #endregion
    }
}
