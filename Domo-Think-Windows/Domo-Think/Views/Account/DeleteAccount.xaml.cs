using DAL.Model;
using DomoThink.Views.Login;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// Pour plus d'informations sur le modèle d'élément Page vierge, voir la page http://go.microsoft.com/fwlink/?LinkId=234238

namespace DomoThink.Views.Account
{
    /// <summary>
    /// Une page vide peut être utilisée seule ou constituer une page de destination au sein d'un frame.
    /// </summary>
    public sealed partial class DeleteAccount : Page
    {
        public DeleteAccount()
        {
            this.InitializeComponent();
        }

        private async void DELETE_ACCOUNT_Click(Object sender, RoutedEventArgs e)
        {
            var loader = new Windows.ApplicationModel.Resources.ResourceLoader();

            MessageDialog dialog = new MessageDialog(
                "Your account will be deleted. Do you want to continue?", 
                "Delete account");

            dialog.Commands.Add(new UICommand(loader.GetString("DialogYes")) { Id = 0 });
            dialog.Commands.Add(new UICommand(loader.GetString("DialogNo")) { Id = 1 });

            dialog.DefaultCommandIndex = 0;
            dialog.CancelCommandIndex = 1;

            var result = await dialog.ShowAsync();

            if ((Int32)result.Id == 0)
            {
                AccountModel _model = new AccountModel();

                _model.Username = this.USERNAME.Text;
                _model.Password = this.PASSWORD.Password;
                _model.UserId = App.UserId;

                // Delete account
                await App.ApiClient.Post<AccountModel, Object>("/user/remove_account", _model);

                // Logout
                await App.ApiClient.Post<LoginResponse, Object>("/user/logout", new LoginResponse() { Token = App.LoginToken });

                Window.Current.Content = new LoginPage();
                Window.Current.Activate();
            }
        }
    }
}
