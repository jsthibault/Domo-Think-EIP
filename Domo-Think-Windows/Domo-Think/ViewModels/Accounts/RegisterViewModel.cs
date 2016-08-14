using DAL.Model;
using DomoThink.MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new Register view model.
        /// </summary>
        public RegisterViewModel()
        {
            // Initialize models
            this.AccountInformations = new AccountModel();

            // Initialize commands
            this.RegisterCommand = new Command(this.RegisterAction);
            this.CancelCommand = new Command(this.CancelAction);
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Register a new account.
        /// </summary>
        /// <param name="param"></param>
        private async void RegisterAction(Object param)
        {
            try
            {
                await Task.Delay(1000);
                // TODO: call API

                ContentDialog _dialog = param as ContentDialog;

                _dialog?.Hide();
            }
            catch { }
        }

        /// <summary>
        /// Cancel the registration.
        /// </summary>
        /// <param name="param"></param>
        private async void CancelAction(Object param)
        {
            try
            {
                await Task.Delay(1000);
            }
            catch { }
        }

        #endregion
    }
}
