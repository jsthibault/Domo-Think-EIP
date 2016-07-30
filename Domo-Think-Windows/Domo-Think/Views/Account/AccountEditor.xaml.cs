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
    public sealed partial class AccountEditor : Page
    {
        AccountModel model;
        Boolean editMode = false;

        public AccountEditor()
        {
            this.InitializeComponent();
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            this.model = e.Parameter as AccountModel;

            this.editMode = model != null;

            if (this.editMode == true)
            {
                //this.METHOD.Text = "Edit directive";
                //this.ADD_EDIT_BUTTON.Content = "Edit";
                //this.DIRECTIVE_ID.Text = model.Id.ToString();
                //this.DIRECTIVE_NAME.Text = model.Name;
            }

            base.OnNavigatedTo(e);
        }

        private async void ADD_EDIT_BUTTON_Click(Object sender, RoutedEventArgs e)
        {
            AccountService _service = new AccountService(App.ApiClient);

            if (this.editMode == true)
            {
                if (this.PASSWORD.Password == this.PASSWORD_CONFIRM.Password)
                {
                    this.model.Username = this.USERNAME.Text;
                    this.model.Password = this.PASSWORD.Password;
                    await _service.UpdateAccount(this.model);
                }
                else
                {
                    this.ERROR_FIELD.Visibility = Visibility.Visible;
                }
            }
            else
            {
                if (this.PASSWORD.Password == this.PASSWORD_CONFIRM.Password)
                {
                    await _service.AddAccount(
                        new AccountModel(
                            this.USERNAME.Text, 
                            this.PASSWORD.Password, 
                            this.PASSWORD_CONFIRM.Password, 
                            this.BOX_KEY.Text));

                    NavigationService.GoBack();
                }
                else
                {
                    this.ERROR_FIELD.Visibility = Visibility.Visible;
                }
            }

        }
    }
}
