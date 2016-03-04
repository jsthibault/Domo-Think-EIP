using Domo_Think.Model;
using Domo_Think.MVVM;
using Domo_Think.Navigation;
using Domo_Think.Network;
using System;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Windows.Input;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

/*--------------------------------------------------------
 * LoginViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 13/12/2015 16:15:26
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.ViewModels
{
    public class LoginViewModel : ViewModelBase
    {
        #region FIELDS

        private Boolean logingIn;
        private Boolean fieldsEnabled;
        private Boolean errorFieldEnabled;
        private String errorText;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets the Login command.
        /// </summary>
        public ICommand LoginCommand { get; private set; }

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

            // Initialize model
            this.LoginInformations = new LoginModel();

            // Initialize properties
            this.FieldsEnabled = true;
            this.LogingIn = false;
            this.ErrorFieldEnabled = false;
            this.ErrorText = String.Empty;
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Switch to the main page.
        /// </summary>
        private void SwitchToMainPage()
        {
            Frame frame = Window.Current.Content as Frame;

            Window.Current.Content = new AppShell(frame);
            NavigationService.InitializeContentFrame(frame);
            NavigationService.Navigate(typeof(Views.MainPage));
            Window.Current.Activate();
            frame.BackStack.Clear();
        }

        private void DisplayErrorMessage(String message)
        {
        }

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

                DomoAPI _api = new DomoAPI(Constants.API_ADDRESS);
                HttpStatusCode _login = await _api.Post<LoginModel>("api/Login/UserLogin", this.LoginInformations);

                if (_login == HttpStatusCode.OK)
                    this.SwitchToMainPage();
                else
                    throw new Exception("Cannot connect to the DomoBox.");
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

        #endregion
    }
}
