using DAL.API;
using DAL.Model;
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
            List<AccountModel> _accounts = await this.api.Get<List<AccountModel>>(ApiRoutes.GET_ACCOUNTS);

            return _accounts;
        }

        public async Task<Boolean> AddAccount(AccountModel model)
        {
            var test = await this.api.Post<AccountModel, Object>("/user/create_account", model);

            return true;
        }

        public async Task<Boolean> UpdateAccount(AccountModel model)
        {
            return true;
        }

        public async Task<Boolean> DeleteAccount(AccountModel model)
        {
            return true;
        }

        #endregion
    }
}
