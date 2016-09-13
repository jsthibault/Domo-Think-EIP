using DAL.Model;
using DomoThink.API;
using DomoThink.MVVM;
using System;
using System.Threading.Tasks;
using System.Windows.Input;
using Windows.UI.Xaml.Controls;

/*--------------------------------------------------------
 * RegisterViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 13/08/2016 18:02:10
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Accounts
{
    public class RegisterViewModel : ViewModelBase
    {
        #region FIELDS

        private Boolean loadingState;
        private Boolean displayState;
        private AccountService accountService;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the account informations.
        /// </summary>
        public AccountModel AccountInformations { get; set; }

        /// <summary>
        /// Gets the Register Command.
        /// </summary>
        public ICommand RegisterCommand { get; private set; }

        /// <summary>
        /// Gets the Cancel command.
        /// </summary>
        public ICommand CancelCommand { get; private set; }

        /// <summary>
        /// Gets or sets the loading state.
        /// </summary>
        public Boolean LoadingState
        {
            get { return this.loadingState; }
            set { this.NotifyPropertyChanged(ref this.loadingState, value); }
        }

        /// <summary>
        /// Gets or sets the display state.
        /// </summary>
        public Boolean DisplayState
        {
            get { return this.displayState; }
            set { this.NotifyPropertyChanged(ref this.displayState, value); }
        }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new Register view model.
        /// </summary>
        public RegisterViewModel()
        {
            // Initialize API service
            this.accountService = new AccountService(App.ApiClient);

            // Initialize properties
            this.LoadingState = false;
            this.DisplayState = true;

            // Initialize models
            this.AccountInformations = new AccountModel();

            // Initialize commands
            this.RegisterCommand = new Command(this.RegisterAction);
            this.CancelCommand = new Command(this.CancelAction);
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Set the loading state.
        /// </summary>
        /// <param name="state"></param>
        private void SetLoadingState(Boolean state)
        {
            this.LoadingState = state;
            this.DisplayState = !state;
        }

        /// <summary>
        /// Close the dialog box.
        /// </summary>
        /// <param name="dialog"></param>
        private void CloseDialod(Object dialog)
        {
            ContentDialog _dialog = dialog as ContentDialog;

            _dialog?.Hide();
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Register a new account.
        /// </summary>
        /// <param name="param"></param>
        private async void RegisterAction(Object param)
        {
            try
            {
                this.SetLoadingState(true);
                await this.accountService.AddAccount(this.AccountInformations);
                this.SetLoadingState(false);
                this.CloseDialod(param);
            }
            catch { }
        }

        /// <summary>
        /// Cancel the registration.
        /// </summary>
        /// <param name="param"></param>
        private void CancelAction(Object param)
        {
            this.CloseDialod(param);
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
