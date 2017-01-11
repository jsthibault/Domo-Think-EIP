using System;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace DomoThink.Controls
{
    public sealed partial class LoadingPanel : UserControl
    {
        private static DependencyProperty IsVisibleProperty = 
            DependencyProperty.Register(
                nameof(IsVisible), 
                typeof(Boolean), 
                typeof(LoadingPanel), 
                new PropertyMetadata(false, IsVisibleChanged));

        private static DependencyProperty TextProperty = 
            DependencyProperty.Register(
                nameof(Text), 
                typeof(String), 
                typeof(LoadingPanel), 
                new PropertyMetadata("Loading..."));
        
        /// <summary>
        /// Gets or sets the Text to be displayed while loading.
        /// </summary>
        public String Text
        {
            get { return this.GetValue(TextProperty).ToString(); }
            set { this.SetValue(TextProperty, value); }
        }

        /// <summary>
        /// Gets or sets the control visibility.
        /// </summary>
        public Boolean IsVisible
        {
            get { return (Boolean)this.GetValue(IsVisibleProperty); }
            set { this.SetValue(IsVisibleProperty, value); }
        }

        /// <summary>
        /// Create a new LoadingPanel instance.
        /// </summary>
        public LoadingPanel()
        {
            this.InitializeComponent();
            (this.Content as FrameworkElement).DataContext = this;
        }

        /// <summary>
        /// Method that process changes when the IsVisible property changes.
        /// </summary>
        /// <param name="d"></param>
        /// <param name="e"></param>
        private static void IsVisibleChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            LoadingPanel _this = d as LoadingPanel;

            if (_this == null)
                return;

            _this.Visibility = (Boolean)e.NewValue ? Visibility.Visible : Visibility.Collapsed;
        }
    }
}
