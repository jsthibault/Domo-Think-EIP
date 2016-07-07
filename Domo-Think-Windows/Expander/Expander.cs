using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace Expander
{
    public class Expander : Control
    {
        private static readonly DependencyProperty HeaderProperty =
            DependencyProperty.Register(
                nameof(Header), 
                typeof(Object),
                typeof(Expander),
                new PropertyMetadata(null));

        private static readonly DependencyProperty ContentProperty =
            DependencyProperty.Register(
                nameof(Content),
                typeof(Object),
                typeof(Expander),
                new PropertyMetadata(null));

        private static readonly DependencyProperty IsVisibleProperty =
            DependencyProperty.Register(
                nameof(IsVisible),
                typeof(Visibility),
                typeof(Expander),
                new PropertyMetadata(Visibility.Collapsed, OnVisibilityChanged));

        public Object Header
        {
            get { return this.GetValue(HeaderProperty); }
            set { this.SetValue(HeaderProperty, value); }
        }

        public Object Content
        {
            get { return this.GetValue(ContentProperty); }
            set { this.SetValue(ContentProperty, value); }
        }

        public Visibility IsVisible
        {
            get { return (Visibility)this.GetValue(IsVisibleProperty); }
            set { this.SetValue(IsVisibleProperty, value); }
        }

        public Expander()
        {
            this.DefaultStyleKey = typeof(Expander);
        }

        protected override void OnApplyTemplate()
        {
            base.OnApplyTemplate();
        }

        private static void OnVisibilityChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            Expander _this = d as Expander;
            Visibility _visibility = (Visibility)e.NewValue;

            if (_this != null)
            {
                if (_visibility == Visibility.Visible)
                    VisualStateManager.GoToState(_this, "Selected", true);
                else
                    VisualStateManager.GoToState(_this, "Normal", true);
            }
        }
    }
}
