using DomoThink.MVVM;
using DomoThink.ViewModels.Accounts;
using System;
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
        public ICommand ChangePasswordCommand { get; private set; }

        public ICommand DeleteMyAccountCommand { get; private set; }
        
        
        public SettingsViewModel()
        {
            // Initialize the commands
            this.ChangePasswordCommand = new Command(this.ChangePasswordAction);
            this.DeleteMyAccountCommand = new Command(this.DeleteMyAccountAction);
        }
        
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

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public override void Refresh(Object parameter)
        {
        }
    }
}
