using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


/*--------------------------------------------------------
 * AService.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 14/04/2016 13:20:11
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DAL.API
{
    public class ApiService
    {
        #region FIELDS

        protected ApiClient api;

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new ApiService.
        /// </summary>
        /// <param name="client">API client</param>
        public ApiService(ApiClient client)
        {
            this.api = client;
        }

        #endregion
    }
}
