using DAL.API;
using DAL.Model;
using DomoThink.Helper;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * AccountService.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 02/06/2016 13:51:05
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.API
{
    public class AccountService : ApiService
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

        public AccountService(ApiClient api)
            : base(api)
        { }

        #endregion

        #region METHODS

        public async Task<List<AccountModel>> GetAccounts()
        {
            try
            {
                List<AccountModel> _accounts = await this.api.Get<List<AccountModel>>(ApiRoutes.GET_ACCOUNTS);

                return _accounts;
            }
            catch
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Error"),
                    ResourceHelper.GetString("ApiError"));

                return null;
            }
        }

        public async Task<Boolean> AddAccount(AccountModel model)
        {
            try
            {
                await this.api.Post<AccountModel, Object>(ApiRoutes.CREATE_ACCOUNT, model);
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

        public async Task<Boolean> UpdateAccount(AccountModel model)
        {
            try
            {
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

        public async Task<Boolean> DeleteAccount(AccountModel model)
        {
            try
            {
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
