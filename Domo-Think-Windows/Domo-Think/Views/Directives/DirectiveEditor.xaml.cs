﻿using DAL.Model;
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

namespace DomoThink.Views.Directives
{
    /// <summary>
    /// Une page vide peut être utilisée seule ou constituer une page de destination au sein d'un frame.
    /// </summary>
    public sealed partial class DirectiveEditor : Page
    {
        private Boolean editMode = false;
        private DirectiveModel model;

        public DirectiveEditor()
        {
            this.InitializeComponent();
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {
            this.model = e.Parameter as DirectiveModel;

            this.editMode = model != null;

            if (this.editMode == true)
            {
                this.METHOD.Text = "Edit directive";
                this.ADD_EDIT_BUTTON.Content = "Edit";
                this.DIRECTIVE_ID.Text = model.Id.ToString();
                this.DIRECTIVE_NAME.Text = model.Name;
            }
        }

        private async void ADD_EDIT_BUTTON_Click(Object sender, RoutedEventArgs e)
        {
            try
            {
                DirectiveService service = new DirectiveService(
                    new DAL.API.ApiClient("http://127.0.0.1:8080/"));

                if (String.IsNullOrEmpty(this.DIRECTIVE_NAME.Text))
                    NavigationService.GoBack();

                if (this.editMode == true)
                {
                    this.model.Name = this.DIRECTIVE_NAME.Text;

                    await service.UpdateDirective(this.model);
                }
                else
                {
                    DirectiveModel _model = new DirectiveModel(-1, this.DIRECTIVE_NAME.Text, -1, -1, -1);

                    await service.AddDirective(_model);
                }

                NavigationService.GoBack();
            }
            catch { }
        }
    }
}