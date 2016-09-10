using DomoThink.API;
using DomoThink.Model;
using DomoThink.MVVM;
using DomoThink.Navigation;
using DAL.Model;
using System;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Windows.Input;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using DomoThink.Helper;

/*--------------------------------------------------------
 * LoginViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 13/12/2015 16:15:26
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels
{
    public class LoginViewModel : ViewModelBase
    {
        #region FIELDS

        private Boolean logingIn;
        private Boolean fieldsEnabled;
        private Boolean errorFieldEnabled;
        private String errorText;

        private UserService userApiService;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets the Login command.
        /// </summary>
        public ICommand LoginCommand { get; private set; }

        /// <summary>
        /// Gets the Register command.
        /// </summary>
        public ICommand RegisterCommand { get; private set; }

        /// <summary>
        /// Gets the Forgot password command which sends an email to the user with a new password.
        /// </summary>
        public ICommand ForgotPasswordCommand { get; private set; }

        /// <summary>
        /// Gets the login informations.
        /// </summary>
        public LoginModel LoginInformations { get; set; }

        /// <summary>
        /// Gets or sets the loging in state.
        /// </summary>
        public Boolean LogingIn
        {
            get { return this.logingIn; }
            set { this.NotifyPropertyChanged(ref this.logingIn, value); }
        }

        /// <summary>
        /// Gets or sets the fields enabled state.
        /// </summary>
        public Boolean FieldsEnabled
        {
            get { return this.fieldsEnabled; }
            set { this.NotifyPropertyChanged(ref this.fieldsEnabled, value); }
        }

        /// <summary>
        /// Gets or sets the error field visbility state.
        /// </summary>
        public Boolean ErrorFieldEnabled
        {
            get { return this.errorFieldEnabled; }
            set { this.NotifyPropertyChanged(ref this.errorFieldEnabled, value); }
        }

        /// <summary>
        /// Gets or sets the error text.
        /// </summary>
        public String ErrorText
        {
            get { return this.errorText; }
            set { this.NotifyPropertyChanged(ref this.errorText, value); }
        }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new LoginViewModel instance.
        /// </summary>
        public LoginViewModel()
        {
            // Initialize commands
            this.LoginCommand = new Command(this.LoginCommandAction);
            this.RegisterCommand = new Command(this.RegisterAction);
            this.ForgotPasswordCommand = new Command(this.ForgotPasswordAction);

            // Initialize model
            this.LoginInformations = new DAL.Model.LoginModel();

            // Initialize properties
            this.FieldsEnabled = true;
            this.LogingIn = false;
            this.ErrorFieldEnabled = false;
            this.ErrorText = String.Empty;

            // Initialize API service
            this.userApiService = new UserService();
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Switch to the main page.
        /// </summary>
        private void SwitchToMainPage()
        {
            Frame frame = new Frame();

            Window.Current.Content = new AppShell(frame);
            NavigationService.InitializeContentFrame(frame);
            NavigationService.Navigate<MainViewModel>();
            Window.Current.Activate();
            frame.BackStack.Clear();
        }

        /// <summary>
        /// Display the error message.
        /// </summary>
        /// <param name="message">Message</param>
        private void DisplayErrorMessage(String message)
        {
            this.ErrorFieldEnabled = true;
            this.ErrorText = message;
        }

        /// <summary>
        /// Hide the error message.
        /// </summary>
        private void HideErrorMessage()
        {
            this.ErrorFieldEnabled = false;
            this.ErrorText = String.Empty;
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Executes the login command action.
        /// </summary>
        /// <param name="parameter"></param>
        private async void LoginCommandAction(Object parameter)
        {
            try
            {
                this.LogingIn = true;
                this.FieldsEnabled = false;
                this.HideErrorMessage();

                //Boolean _connected = await this.loginService.SendLoginRequest(this.LoginInformations);

                //if (_connected)
                    this.SwitchToMainPage();
                //else
                //    throw new Exception("Cannot connect to the DomoBox.");
            }
            catch (Exception e)
            {
                // Display Error
                this.LogingIn = false;
                this.FieldsEnabled = true;
                this.DisplayErrorMessage(e.Message);

                // Wait 3 seconds
                await Task.Delay(3000);

                // Remove the error message
                this.HideErrorMessage();
            }
        }

        private async void ForgotPasswordAction(Object param)
        {
            try
            {
                String _message = "Please enter username.";

                if (String.IsNullOrEmpty(this.LoginInformations?.Id) == false)
                    _message = "An email as been sent to you.";

                this.DisplayErrorMessage(_message);

                // Wait 3 seconds
                await Task.Delay(3000);

                // Remove the error message
                this.HideErrorMessage();
            }
            catch
            {
            }
        }

        private async void RegisterAction(Object param)
        {
            try
            {

                await Task.Delay(1000);

                Views.Login.RegisterDialog _register = new Views.Login.RegisterDialog();

                await _register.ShowAsync();
            }
            catch
            {
            }
        }

        #endregion
    }
}
