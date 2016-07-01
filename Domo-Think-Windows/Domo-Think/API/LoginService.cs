using DAL.API;
using DAL.Model;
using System;
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

namespace DomoThink.API
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
            LoginResponse response =
                await this.api.Post<LoginModel, LoginResponse>(ApiRoutes.USER_CONNECT, loginModel);

            // TODO: more checks...
            return response != null;
        }

        #endregion
    }
}
