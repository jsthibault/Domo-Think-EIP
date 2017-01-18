using System;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace DomoThink.Controls
{
    public sealed partial class Panel : UserControl
    {
        private static readonly DependencyProperty TitleProperty =
            DependencyProperty.Register("Title", typeof(String), typeof(Panel), null);

        public static readonly DependencyProperty PanelContentProperty =
            DependencyProperty.Register("PanelContent", typeof(object), typeof(Panel), null);
        

        public String Title
        {
            get { return (String)this.GetValue(TitleProperty); }
            set { this.SetValue(TitleProperty, value); }
        }

        public object PanelContent
        {
            get { return this.GetValue(PanelContentProperty); }
            set { this.SetValue(PanelContentProperty, value); }
        }

        public Panel()
        {
            this.InitializeComponent();
        }
    }
}
