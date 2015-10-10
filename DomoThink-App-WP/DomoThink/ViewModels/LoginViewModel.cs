using DomoThink.Models;
using DomoThink.MVVM;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

/*--------------------------------------------------------
 * LoginViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 10/10/2015 14:34:51
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels
{
    public class LoginViewModel : ViewModelBase
    {
        #region FIELDS

        private LoginModel loginInformations;
        private Boolean fieldsVisibility;
        private Boolean loadingVisibility;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the login informations.
        /// </summary>
        public LoginModel LoginInformations
        {
            get { return this.loginInformations; }
            set { this.NotifyPropertyChanged(ref this.loginInformations, value); }
        }

        /// <summary>
        /// Gets or sets the information fields visibility state.
        /// </summary>
        public Boolean FieldsVisibility
        {
            get { return this.fieldsVisibility; }
            set { this.NotifyPropertyChanged(ref this.fieldsVisibility, value); }
        }

        /// <summary>
        /// Gets or sets the loading screen visibility state.
        /// </summary>
        public Boolean LoadingVisibility
        {
            get { return this.loadingVisibility; }
            set { this.NotifyPropertyChanged(ref this.loadingVisibility, value); }
        }

        /// <summary>
        /// Gets the Login command action.
        /// </summary>
        public ICommand LoginCommand { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new LoginViewModel instance.
        /// </summary>
        public LoginViewModel()
        {
            this.LoginInformations = new LoginModel();
            this.FieldsVisibility = true;
            this.LoadingVisibility = !this.FieldsVisibility;

            // Initialize commands
            this.LoginCommand = new RelayCommand(this.LoginCommandAction);
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Process the login command action.
        /// </summary>
        /// <param name="param">Login command parameter.</param>
        private void LoginCommandAction(Object param)
        {
            if (String.IsNullOrEmpty(this.LoginInformations.Id) || 
                String.IsNullOrEmpty(this.loginInformations.Password))
                return;

            // Set the visibility states
            this.FieldsVisibility = false;
            this.LoadingVisibility = true;

            // TODO: process login to the DomoBox and then process change page
        }

        #endregion

        #region METHODS



        #endregion
    }
}
