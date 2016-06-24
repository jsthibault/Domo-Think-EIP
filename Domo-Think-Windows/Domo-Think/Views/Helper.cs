using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Xaml;

namespace DomoThink.Views
{
    public class Helper : DependencyObject
    {
        public static readonly DependencyProperty IsSelectedProperty =
        DependencyProperty.RegisterAttached(
          "IsSelected",
          typeof(Boolean),
          typeof(Helper),
          new PropertyMetadata(false)
        );

        public static void SetIsSelected(UIElement element, Boolean value)
        {
            element.SetValue(IsSelectedProperty, value);
        }

        public static Boolean GetIsSelected(UIElement element)
        {
            return (Boolean)element.GetValue(IsSelectedProperty);
        }
    }
}
