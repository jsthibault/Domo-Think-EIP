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

/*--------------------------------------------------------
 * ChangePasswordViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 16/08/2016 15:53:41
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Accounts
{
    public class ChangePasswordViewModel : ViewModelBase
    {
        #region FIELDS

        private UserService userApiService;

        private Boolean changePasswordButtonEnabled;
        private Boolean changePasswordRingVisibility;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the account informations.
        /// </summary>
        public AccountModel AccountInformations { get; set; }

        /// <summary>
        /// Gets or sets the change password button enabled state.
        /// </summary>
        public Boolean ChangePasswordButtonEnabled
        {
            get { return this.changePasswordButtonEnabled; }
            set { this.NotifyPropertyChanged(ref this.changePasswordButtonEnabled, value); }
        }

        /// <summary>
        /// Gets or sets the progress ring visibility.
        /// </summary>
        public Boolean ChangePasswordRingVisibility
        {
            get { return this.changePasswordRingVisibility; }
            set { this.NotifyPropertyChanged(ref this.changePasswordRingVisibility, value); }
        }

        /// <summary>
        /// Gets the Change password command.
        /// </summary>
        public ICommand ChangePasswordCommand { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Initialize the view model.
        /// </summary>
        public ChangePasswordViewModel()
        {
            // Initialize API service
            this.userApiService = new UserService();

            // Initialize properties
            this.AccountInformations = new AccountModel();
            this.SetLoadingState(false);

            // Initialize commands
            this.ChangePasswordCommand = new Command(this.ChangePasswordAction);
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Set the action loading state.
        /// </summary>
        /// <param name="state"></param>
        private void SetLoadingState(Boolean state)
        {
            this.ChangePasswordRingVisibility = state;
            this.ChangePasswordButtonEnabled = !state;
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Change the password of the account.
        /// </summary>
        /// <param name="param"></param>
        private async void ChangePasswordAction(Object param)
        {
            this.SetLoadingState(true);

            if (this.AccountInformations.Password != this.AccountInformations.PasswordConfirmation)
            {
                this.SetLoadingState(false);
                return;
            }

            this.AccountInformations.UserId = App.UserId;

            Boolean _result = await this.userApiService.SendChangePassword(this.AccountInformations);

            if (_result == true)
            {
                NotificationHelper.ShowToastNotification(
                    ResourceHelper.GetString("Account"), 
                    ResourceHelper.GetString("PasswordChanged"));
                this.Pop();
            }

            this.SetLoadingState(false);
        }

        #endregion

        #region ABSTRACT

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public override void Refresh(Object parameter)
        {
        }

        #endregion
    }
}
