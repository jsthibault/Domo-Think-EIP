using DomoAPI.Client;
using DomoAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


/*--------------------------------------------------------
 * LoginModule.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 13/04/2016 22:07:41
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.API
{
    public class LoginService : ApiService
    {
        #region FIELDS
        #endregion

        #region PROPERTIES
        #endregion

        #region CONSTRUCTORS

        public LoginService(ApiClient api)
            : base(api)
        { }

        #endregion

        #region METHODS

        public async Task<Boolean> SendLoginRequest(LoginModel loginModel)
        {
            LoginResponse response = await this.api.Post<LoginModel, LoginResponse>("api/Login/UserLogin", loginModel);

            // TODO: more checks...
            return response != null;
        }

        #endregion
    }
}
