using DomoAPI.Client;
using DomoAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
            return await this.api.Get<List<ObjectModel>>(ApiRoutes.GET_OBJECTS);
        }

        #endregion
    }
}
