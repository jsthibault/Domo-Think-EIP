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

namespace DomoThink.Views.Objects
{
    /// <summary>
    /// Une page vide peut être utilisée seule ou constituer une page de destination au sein d'un frame.
    /// </summary>
    public sealed partial class ObjectEditor : Page
    {
        private Boolean editMode = false;
        private ObjectModel model;

        public ObjectEditor()
        {
            this.InitializeComponent();
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            this.model = e.Parameter as ObjectModel;

            this.editMode = model != null;

            if (this.editMode == true)
            {
                this.METHOD.Text = "Edit object";
                this.ADD_EDIT_BUTTON.Content = "Edit";
                this.OBJECT_ID.Text = model.Id.ToString();
                this.OBJECT_NAME.Text = model.Name;
            }
        }

        private async void ADD_EDIT_BUTTON_Click(Object sender, RoutedEventArgs e)
        {
            ObjectService service = new ObjectService(
                new DAL.API.ApiClient("http://127.0.0.1:8080/"));

            if (this.editMode == true)
            {
                this.model.Name = this.OBJECT_NAME.Text;

                await service.UpdateObject(this.model);
            }
            else
            {
                ObjectModel _model = new ObjectModel(-1, this.OBJECT_NAME.Text);

                await service.AddObject(_model);
            }

            NavigationService.GoBack();
        }
    }
}
