using DAL.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Text;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// Pour plus d'informations sur le modèle d'élément Boîte de dialogue de contenu, voir la page http://go.microsoft.com/fwlink/?LinkId=234238

namespace DomoThink.Views.Store
{
    public sealed partial class AddComment : ContentDialog
    {
        private int pluginId;

        public AddComment(int pluginId)
        {
            this.InitializeComponent();

            this.pluginId = pluginId;
        }

        private async void ContentDialog_PrimaryButtonClick(ContentDialog sender, ContentDialogButtonClickEventArgs args)
        {
            string commentText = null;

            this.COMMENT_TEXT.Document.GetText(TextGetOptions.UseCrlf, out commentText);
            var comment = new PluginComment()
            {
                //PluginId = this.pluginId,
                Author = this.AUTHOR_TEXT.Text,
                Comment = commentText,
                //Date = "",
                Rate = 2,
                KeyLoginHash = "YOLO_HASH"
            };

            await AppContext.StoreService.PostComment(comment, this.pluginId);
        }

        private void ContentDialog_SecondaryButtonClick(ContentDialog sender, ContentDialogButtonClickEventArgs args)
        {
        }
    }
}
