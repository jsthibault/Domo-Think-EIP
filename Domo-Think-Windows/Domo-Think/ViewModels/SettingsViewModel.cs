using DomoThink.MVVM;
using DomoThink.Navigation;
using DomoThink.ViewModels.Accounts;
using DomoThink.Views.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

/*--------------------------------------------------------
 * SettingsViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 29/12/2015 14:20:09
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels
{
    public class SettingsViewModel : ViewModelBase
    {
        #region FIELDS



        #endregion

        #region PROPERTIES

        public ICommand ChangePasswordCommand { get; private set; }

        public ICommand DeleteMyAccountCommand { get; private set; }

        #endregion

        #region CONSTRUCTORS

        public SettingsViewModel()
        {
            // Initialize the commands
            this.ChangePasswordCommand = new Command(this.ChangePasswordAction);
            this.DeleteMyAccountCommand = new Command(this.DeleteMyAccountAction);
        }

        #endregion

        #region METHODS



        #endregion

        #region ACTIONS
        
        private void ChangePasswordAction(Object param)
        {
            new ChangePasswordViewModel().Push();
            //NavigationService.Navigate<ChangePasswordViewModel>();
        }

        private void DeleteMyAccountAction(Object param)
        {
            new DeleteAccountViewModel().Push();
            //NavigationService.Navigate<DeleteAccountViewModel>();
        }


        #endregion

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public override void Refresh(Object parameter)
        {
        }
    }
}
