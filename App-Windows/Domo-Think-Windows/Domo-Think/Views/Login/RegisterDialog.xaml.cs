using DomoThink.Helper;
using Windows.UI.Xaml.Controls;

namespace DomoThink.Views.Login
{
    public sealed partial class RegisterDialog : ContentDialog
    {
        public RegisterDialog()
        {
            this.InitializeComponent();
            this.Title = ResourceHelper.GetString("RegistrationDialogTitle");
        }
    }
}
