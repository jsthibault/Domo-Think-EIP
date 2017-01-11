﻿using System;
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

namespace DomoThink.Controls
{
    public sealed partial class Panel : UserControl
    {
        private static readonly DependencyProperty TitleProperty =
            DependencyProperty.Register("Title", typeof(String), typeof(Panel), null);

        public String Title
        {
            get { return (String)this.GetValue(TitleProperty); }
            set { this.SetValue(TitleProperty, value); }
        }

        public Panel()
        {
            this.InitializeComponent();
            this.DataContext = this;
        }
    }
}
