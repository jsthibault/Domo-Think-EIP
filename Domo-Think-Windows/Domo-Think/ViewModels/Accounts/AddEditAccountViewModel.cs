using DAL.Model;
using DomoThink.API;
using DomoThink.Helper;
using DomoThink.MVVM;
using DomoThink.Navigation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Windows.UI.Notifications;

/*--------------------------------------------------------
 * AddEditAccountViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 14/08/2016 15:21:28
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Accounts
{
    public class AddEditAccountViewModel : ViewModelBase
    {
        #region CONSTANTS

        private const Int32 ERROR_MESSAGE_TIME = 5;

        private const String PASSWORD_NO_MATCH = "PasswordDoesntMatch";

        private const String API_ERROR = "ApiError";

        #endregion

        #region FIELDS

        private AccountMode mode;
        private AccountModel accountInformations;
        private AccountService service;

        private Boolean errorVisibility;
        private String errorMessage;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the accout editor mode.
        /// </summary>
        public AccountMode Mode
        {
            get { return this.mode; }
            set { this.NotifyPropertyChanged(ref this.mode, value); }
        }

        /// <summary>
        /// Gets or sets the account informations.
        /// </summary>
        public AccountModel AccountInformations
        {
            get { return this.accountInformations; }
            set { this.NotifyPropertyChanged(ref this.accountInformations, value); }
        }

        /// <summary>
        /// Gets or sets the error message.
        /// </summary>
        public String ErrorMessage
        {
            get { return this.errorMessage; }
            set { this.NotifyPropertyChanged(ref this.errorMessage, value); }
        }

        /// <summary>
        /// Gets or sets the error visibility.
        /// </summary>
        public Boolean ErrorVisibility
        {
            get { return this.errorVisibility; }
            set { this.NotifyPropertyChanged(ref this.errorVisibility, value); }
        }

        /// <summary>
        /// Gets the create or edit command depending of the Mode property.
        /// </summary>
        public ICommand CreateEditCommand { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new instance.
        /// </summary>
        public AddEditAccountViewModel()
        {
            // Initialize properties
            this.Mode = AccountMode.Create;
            this.AccountInformations = new AccountModel();

            // Initialize API service
            this.service = new AccountService(App.ApiClient);

            // Initialize commands
            this.CreateEditCommand = new Command(this.CreateEditAction);
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Create a new account.
        /// </summary>
        /// <param name="param"></param>
        private async Task<Boolean> CreateAccount(Object param)
        {
            if (this.AccountInformations.Password != this.AccountInformations.PasswordConfirmation)
            {
                await this.ShowError(ResourceHelper.GetString(PASSWORD_NO_MATCH), ERROR_MESSAGE_TIME);
                return false;
            }

            Boolean _result = await this.service.AddAccount(this.AccountInformations);

            if (_result == false)
            {
                await this.ShowError(ResourceHelper.GetString(API_ERROR), ERROR_MESSAGE_TIME);
            }

            return _result;
        }

        /// <summary>
        /// Edit an existing account.
        /// </summary>
        /// <param name="param"></param>
        private async Task<Boolean> EditAccount(Object param)
        {
            if (this.AccountInformations.Password != this.AccountInformations.PasswordConfirmation)
            {
                await this.ShowError(ResourceHelper.GetString(PASSWORD_NO_MATCH), ERROR_MESSAGE_TIME);
                return false;
            }

            Boolean _result = await this.service.UpdateAccount(this.AccountInformations);

            if (_result == false)
                await this.ShowError(ResourceHelper.GetString(API_ERROR), ERROR_MESSAGE_TIME);

            return _result;
        }

        /// <summary>
        /// Show error message in the view.
        /// </summary>
        /// <param name="text"></param>
        /// <param name="time"></param>
        /// <returns></returns>
        private async Task<Boolean> ShowError(String text, Int32 time)
        {
            this.ErrorMessage = text;
            this.ErrorVisibility = true;

            await Task.Delay(time * 1000);

            this.ErrorMessage = String.Empty;
            this.ErrorVisibility = false;

            return true;
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Create or edit account action.
        /// </summary>
        /// <param name="param"></param>
        private async void CreateEditAction(Object param)
        {
            Boolean _result = false;

            if (this.Mode == AccountMode.Create)
                _result = await this.CreateAccount(param);
            else
                _result = await this.EditAccount(param);

            if (_result)
                NavigationService.GoBack();
        }
        
        #endregion
    }
}
