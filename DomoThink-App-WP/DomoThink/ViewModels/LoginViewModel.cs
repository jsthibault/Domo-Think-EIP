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



        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the login informations.
        /// </summary>
        public LoginModel LoginInformations { get; set; }

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

            // Initialize commands
            this.LoginCommand = new RelayCommand(this.LoginCommandAction);
        }

        #endregion

        #region ACTIONS

        private void LoginCommandAction(Object param)
        {
        }

        #endregion

        #region METHODS



        #endregion
    }
}
