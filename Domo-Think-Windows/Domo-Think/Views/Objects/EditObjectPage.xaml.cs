using DAL.Model;
using DomoThink.ViewModels.Objects;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;

namespace DomoThink.Views.Objects
{
    public sealed partial class EditObjectPage : Page
    {
        public EditObjectPage()
        {
            this.InitializeComponent();
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            EditObjectViewModel _viewModel = this.DataContext as EditObjectViewModel;

            _viewModel.ObjectInformations = e.Parameter as ObjectModel;
        }
    }
}
