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

// The User Control item template is documented at http://go.microsoft.com/fwlink/?LinkId=234236

namespace Domo_Think.Controls
{
    public sealed partial class LoadingPanel : UserControl
    {
        private static DependencyProperty IsVisibleProperty = DependencyProperty.Register("IsVisible", typeof(Boolean), typeof(LoadingPanel), new PropertyMetadata(false, IsVisibleChanged));
        private static DependencyProperty TextProperty = DependencyProperty.Register("Text", typeof(String), typeof(LoadingPanel), new PropertyMetadata("Loading..."));

        public String Text
        {
            get { return this.GetValue(TextProperty).ToString(); }
            set { this.SetValue(TextProperty, value); }
        }

        public Boolean IsVisible
        {
            get { return (Boolean)this.GetValue(IsVisibleProperty); }
            set { this.SetValue(IsVisibleProperty, value); }
        }

        public LoadingPanel()
        {
            this.InitializeComponent();
            (this.Content as FrameworkElement).DataContext = this;
        }

        private static void IsVisibleChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            LoadingPanel _this = d as LoadingPanel;

            if (_this == null)
                return;

            _this.Visibility = (Boolean)e.NewValue ? Visibility.Visible : Visibility.Collapsed;
        }
    }
}
