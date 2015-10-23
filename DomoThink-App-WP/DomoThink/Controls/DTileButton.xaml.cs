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
    public sealed partial class DTileButton : UserControl
    {
        public static DependencyProperty IconProperty = DependencyProperty.Register("Icon", typeof(String), typeof(DTileButton), null);
        public static DependencyProperty TextProperty = DependencyProperty.Register("Text", typeof(String), typeof(DTileButton), null);
        public static DependencyProperty CommandProperty = DependencyProperty.Register("Command", typeof(ICommand), typeof(DTileButton), null);

        /// <summary>
        /// Gets or sets the button icon.
        /// </summary>
        public String Icon
        {
            get { return this.GetValue(IconProperty).ToString(); }
            set { this.SetValue(IconProperty, value); }
        }

        /// <summary>
        /// Gets or sets the button text.
        /// </summary>
        public String Text
        {
            get { return this.GetValue(TextProperty).ToString(); }
            set { this.SetValue(TextProperty, value); }
        }

        /// <summary>
        /// Gets or sets the button command action.
        /// </summary>
        public ICommand Command
        {
            get { return this.GetValue(CommandProperty) as ICommand; }
            set { this.SetValue(CommandProperty, value); }
        }

        /// <summary>
        /// Creates a new DTileButton instance.
        /// </summary>
        public DTileButton()
        {
            this.InitializeComponent();
            (this.Content as FrameworkElement).DataContext = this;
        }
    }
}
