using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
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
    public sealed partial class RatingStar : UserControl
    {
        public static DependencyProperty MaxStarsProperty = DependencyProperty.Register("MaxStars", typeof(Int32), typeof(RatingStar), new PropertyMetadata(5));
        public static DependencyProperty CurrentStarsCountProperty = DependencyProperty.Register("CurrentStarsCount", typeof(Int32), typeof(RatingStar), new PropertyMetadata(0, new PropertyChangedCallback(StarsChangedCallback)));
        public static DependencyProperty StarsFontSizeProperty = DependencyProperty.Register("StarsFontSize", typeof(Single), typeof(RatingStar), new PropertyMetadata(12));

        public Int32 MaxStars
        {
            get { return (Int32)this.GetValue(MaxStarsProperty); }
            set { this.SetValue(MaxStarsProperty, value); }
        }

        public Int32 CurrentStarsCount
        {
            get { return (Int32)this.GetValue(CurrentStarsCountProperty); }
            set { this.SetValue(CurrentStarsCountProperty, value); }
        }

        public Single StarsFontSize
        {
            get { return (Single)this.GetValue(StarsFontSizeProperty); }
            set { this.SetValue(StarsFontSizeProperty, value); }
        }

        public RatingStar()
        {
            this.InitializeComponent();
            this.DataContext = this;
            this.CurrentStarsCount = 0;
        }

        private static void StarsChangedCallback(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            RatingStar _ratingStarObject = d as RatingStar;

            if (_ratingStarObject != null)
            {
                if (_ratingStarObject.CurrentStarsCount > _ratingStarObject.MaxStars)
                    _ratingStarObject.CurrentStarsCount = _ratingStarObject.MaxStars;

                if (_ratingStarObject.CurrentStarsCount == 0)
                    _ratingStarObject.STARS.Text = "\uE224 \uE224 \uE224 \uE224 \uE224";
                //else if (_ratingStarObject.CurrentStarsCount == 0.5f)
                //    _ratingStarObject.STARS.Text = "\uE7C6 \uE224 \uE224 \uE224 \uE224";
                else if (_ratingStarObject.CurrentStarsCount == 1f)
                    _ratingStarObject.STARS.Text = "\uE224 \uE224 \uE224 \uE224 \uE224";
                //else if (_ratingStarObject.CurrentStarsCount == 1.5f)
                //    _ratingStarObject.STARS.Text = "\uE0B4 \uE7C6 \uE224 \uE224 \uE224";
                else if (_ratingStarObject.CurrentStarsCount == 2f)
                    _ratingStarObject.STARS.Text = "\uE0B4 \uE0B4 \uE224 \uE224 \uE224";
                //else if (_ratingStarObject.CurrentStarsCount == 2.5f)
                //    _ratingStarObject.STARS.Text = "\uE0B4 \uE0B4 \uE7C6 \uE224 \uE224";
                else if (_ratingStarObject.CurrentStarsCount == 3f)
                    _ratingStarObject.STARS.Text = "\uE0B4 \uE0B4 \uE0B4 \uE224 \uE224";
                //else if (_ratingStarObject.CurrentStarsCount == 3.5f)
                //    _ratingStarObject.STARS.Text = "\uE0B4 \uE0B4 \uE0B4 \uE7C6 \uE224";
                else if (_ratingStarObject.CurrentStarsCount == 4f)
                    _ratingStarObject.STARS.Text = "\uE0B4 \uE0B4 \uE0B4 \uE0B4 \uE224";
                //else if (_ratingStarObject.CurrentStarsCount == 4.5f)
                //    _ratingStarObject.STARS.Text = "\uE0B4 \uE0B4 \uE0B4 \uE0B4 \uE7C6";
                else if (_ratingStarObject.CurrentStarsCount == 5f)
                    _ratingStarObject.STARS.Text = "\uE0B4 \uE0B4 \uE0B4 \uE0B4 \uE0B4";
            }
        }
    }
}
