using DAL.Model;
using DomoThink.API;
using DomoThink.Navigation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
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
    public sealed partial class ChangePassword : Page
    {
        public ChangePassword()
        {
            this.InitializeComponent();
        }

        private async void CHANGE_PASSWORD_Click(Object sender, RoutedEventArgs e)
        {
            try
            {
                AccountService _service = new AccountService(App.ApiClient);
                AccountModel _model = new AccountModel();

                _model.Username = this.USERNAME.Text;
                _model.UserId = App.UserId;
                _model.OldPassword = this.OLD_PASSWORD.Password;
                _model.NewPassword = this.PASSWORD.Password;
                _model.PasswordConfirmation = this.PASSWORD_CONFIRM.Password;

                await App.ApiClient.Post<AccountModel, Object>("/user/change_password", _model);

                NavigationService.GoBack();
            }
            catch { }
        }
    }
}
