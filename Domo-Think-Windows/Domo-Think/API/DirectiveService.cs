using DomoAPI.Client;
using DomoAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

namespace Domo_Think.API
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
            return await this.api.Get<List<DirectiveModel>>("api/Directives/GetDirectives");
        }

        #endregion
    }
}
