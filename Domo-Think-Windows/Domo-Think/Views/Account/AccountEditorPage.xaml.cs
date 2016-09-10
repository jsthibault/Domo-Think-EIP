using DAL.Model;
using DomoThink.ViewModels.Accounts;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;

namespace DomoThink.Views.Account
{
    public sealed partial class AccountEditorPage : Page
    {
        public AccountEditorPage()
        {
            this.InitializeComponent();
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            if (e.Parameter == null)
                return;

            AddEditAccountViewModel _dataContext = this.DataContext as AddEditAccountViewModel;
            _dataContext.AccountInformations = e.Parameter as AccountModel;
            _dataContext.Mode = EditorMode.Edit;

            base.OnNavigatedTo(e);
        }
    }
}
