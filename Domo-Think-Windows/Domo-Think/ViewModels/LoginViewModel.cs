using Domo_Think.Model;
using Domo_Think.MVVM;
using Domo_Think.Navigation;
using System;
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

        #endregion

        #region ACTIONS

        /// <summary>
        /// Executes the login command action.
        /// </summary>
        /// <param name="parameter"></param>
        private async void LoginCommandAction(Object parameter)
        {
            this.LogingIn = true;
            this.FieldsEnabled = false;

            await Task.Delay(5000); // wait for 5 seconds

            this.SwitchToMainPage();
        }

        #endregion
    }
}
