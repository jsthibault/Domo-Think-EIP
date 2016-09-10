using DAL.API;
using DAL.IO;
using DAL.Model;
using DomoThink.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * UserService.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 16/08/2016 15:59:09
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.API
{
    public class UserService : ApiService
    {
        #region FIELDS



        #endregion

        #region PROPERTIES



        #endregion

        #region CONSTRUCTORS

        public UserService()
            : base(App.ApiClient)
        { }

        #endregion

        #region METHODS

        /// <summary>
        /// Sends a login request to the API.
        /// </summary>
        /// <param name="loginModel"></param>
        /// <returns></returns>
        public async Task<Boolean> SendLoginRequest(LoginModel loginModel)
        {
            try
            {
                LoginResponse response =
                    await this.api.Post<LoginModel, LoginResponse>(ApiRoutes.USER_CONNECT, loginModel);

                App.LoginToken = response?.Token;
                App.UserId = response?.Id;

                // TODO: more checks...
                if (response == null)
                    throw new NullReferenceException();
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

        /// <summary>
        /// Send a forgot password request to the API.
        /// </summary>
        /// <param name="loginModel"></param>
        /// <returns></returns>
        public async Task<Boolean> SendForgotPasswordRequest(LoginModel loginModel)
        {
            try
            {
                LoginResponse response =
                   await this.api.Post<LoginModel, LoginResponse>(ApiRoutes.USER_FORGOT_PASSWORD, loginModel);

                if (response == null)
                    throw new NullReferenceException();
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

        /// <summary>
        /// Send a change password request to the API.
        /// </summary>
        /// <param name="accountModel"></param>
        /// <returns></returns>
        public async Task<Boolean> SendChangePassword(AccountModel accountModel)
        {
            try
            {
                Object response = await App.ApiClient.Post<AccountModel, Object>("/user/change_password", accountModel);

                if (response == null)
                    throw new NullReferenceException();
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
