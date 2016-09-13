using DAL.Model;
using DomoThink.API;
using DomoThink.Navigation;
using DomoThink.ViewModels.Directives;
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

namespace DomoThink.Views.Directives
{
    public sealed partial class DirectiveEditor : Page
    {
        public DirectiveEditor()
        {
            this.InitializeComponent();
        }

        //protected override void OnNavigatedTo(NavigationEventArgs e)
        //{
        //    DirectiveEditorViewModel _viewModel = this.DataContext as DirectiveEditorViewModel;

        //    _viewModel.DirectiveInformations = e.Parameter as DirectiveModel;
        //}

        //private async void ADD_EDIT_BUTTON_Click(Object sender, RoutedEventArgs e)
        //{
        //    try
        //    {
        //        DirectiveService service = new DirectiveService(
        //            new DAL.API.ApiClient("http://127.0.0.1:8080/"));

        //        if (String.IsNullOrEmpty(this.DIRECTIVE_NAME.Text))
        //            NavigationService.GoBack();

        //        if (this.editMode == true)
        //        {
        //            this.model.Name = this.DIRECTIVE_NAME.Text;

        //            await service.UpdateDirective(this.model);
        //        }
        //        else
        //        {
        //            DirectiveModel _model = new DirectiveModel(-1, this.DIRECTIVE_NAME.Text, -1, -1, -1);

        //            await service.AddDirective(_model);
        //        }

        //        NavigationService.GoBack();
        //    }
        //    catch { }
        //}
    }
}
