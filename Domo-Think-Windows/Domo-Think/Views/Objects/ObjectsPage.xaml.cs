using Domo_Think.ViewModels;
using System;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace Domo_Think.Views.Objects
{
    public sealed partial class ObjectsPage : Page
    {
        public ObjectsPage()
        {
            this.InitializeComponent();
        }

        private void TOGGLE_ITEM_STATE_Toggled(Object sender, RoutedEventArgs e)
        {
            (this.DataContext as ObjectsViewModel).SwitchObjectStateCommand.Execute((sender as ToggleSwitch).IsOn);
        }
    }
}
