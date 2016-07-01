using System;
using System.Windows.Input;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace DomoThink.Controls
{
    public partial class DomoPage : Page
    {
        private DependencyProperty OnLoadedProperty = 
            DependencyProperty.Register(
                nameof(OnLoaded), 
                typeof(ICommand), 
                typeof(DomoPage), 
                new PropertyMetadata(null));

        /// <summary>
        /// Gets or sets the command to be executed when the page loads.
        /// </summary>
        public ICommand OnLoaded
        {
            get { return this.GetValue(OnLoadedProperty) as ICommand; }
            set { this.SetValue(OnLoadedProperty, value); }
        }

        /// <summary>
        /// Creates a new DomoPage.
        /// </summary>
        public DomoPage()
        {
            this.InitializeComponent();
            this.Loaded += DomoPage_Loaded;
        }

        /// <summary>
        /// Loads the page.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DomoPage_Loaded(Object sender, RoutedEventArgs e)
        {
            this.OnLoaded?.Execute(null);
        }
    }
}
