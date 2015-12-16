using Domo_Think.ViewModels;
using System;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace Domo_Think.Views.Objects
{
    public sealed partial class ObjectsPage : Page
    {
        private ObjectsViewModel dataContext;

        public ObjectsPage()
        {
            this.InitializeComponent();
            this.dataContext = this.DataContext as ObjectsViewModel;
            this.Loaded += ObjectsPage_Loaded;
        }

        private void ObjectsPage_Loaded(Object sender, RoutedEventArgs e)
        {
            this.dataContext.LoadObjectsCommand.Execute(null);
        }

        private void TOGGLE_ITEM_STATE_Toggled(Object sender, RoutedEventArgs e)
        {
            this.dataContext.SwitchObjectStateCommand.Execute((sender as ToggleSwitch).IsOn);
        }
    }
}
