using DAL.Model;
using DomoThink.Helper;
using DomoThink.MVVM;
using DomoThink.Views.Login;
using System;
using System.Windows.Input;
using Windows.UI.Popups;
using Windows.UI.Xaml;

/*--------------------------------------------------------
 * DeleteAccountViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 16/08/2016 16:45:47
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Accounts
{
    public class DeleteAccountViewModel : ViewModelBase
    {
        public AccountModel AccountInformations { get; set; }

        public ICommand DeleteAccountCommand { get; private set; }
        
        public DeleteAccountViewModel()
        {
            // Initialize properties
            this.AccountInformations = new AccountModel("", "");

            // Initialize commands
            this.DeleteAccountCommand = new Command(this.DeleteAccountAction);
            
        }

        private async void DeleteAccountAction(Object param)
        {
            MessageDialog dialog = new MessageDialog(
                   ResourceHelper.GetString("YourAccountWillBeDeleted"),
                   ResourceHelper.GetString("DeleteAccount"));

            dialog.Commands.Add(new UICommand(ResourceHelper.GetString("DialogYes")) { Id = 0 });
            dialog.Commands.Add(new UICommand(ResourceHelper.GetString("DialogNo")) { Id = 1 });

            dialog.DefaultCommandIndex = 0;
            dialog.CancelCommandIndex = 1;

            var result = await dialog.ShowAsync();

            if ((Int32)result.Id == 0)
            {
                // Process account deletion.
                this.AccountInformations.UserId = App.UserId.ToString();

                // Delete account
                await App.ApiClient.Post<AccountModel, Object>("/user/delete", this.AccountInformations);

                // Logout
                await App.ApiClient.Post<LoginResponse, Object>("/user/logout", new LoginResponse() { Token = App.LoginToken });

                Window.Current.Content = new LoginPage();
                Window.Current.Activate();
            }
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
