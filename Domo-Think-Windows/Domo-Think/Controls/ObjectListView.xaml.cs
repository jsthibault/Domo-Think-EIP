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

namespace DomoThink.Controls
{
    public sealed partial class ObjectListView : UserControl
    {
        public ObjectListView()
        {
            this.InitializeComponent();
        }

        public void SetInEditMode()
        {
            VisualStateManager.GoToState(this, "Selected", true);
        }

        public void SetInViewMode()
        {
            VisualStateManager.GoToState(this, "Normal", true);
        }
    }
}
