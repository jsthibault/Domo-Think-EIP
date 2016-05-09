using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Windows.Input;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

namespace DomoThink.Controls
{
    public partial class DomoPage : Page
    {
        private DependencyProperty OnLoadedProperty = DependencyProperty.Register("OnLoaded", typeof(ICommand), typeof(DomoPage), null);

        public ICommand OnLoaded
        {
            get { return this.GetValue(OnLoadedProperty) as ICommand; }
            set { this.SetValue(OnLoadedProperty, value); }
        }

        public DomoPage()
        {
            this.InitializeComponent();

            this.Loaded += DomoPage_Loaded;
        }

        private void DomoPage_Loaded(Object sender, RoutedEventArgs e)
        {
            this.OnLoaded?.Execute(null);
        }
    }
}
