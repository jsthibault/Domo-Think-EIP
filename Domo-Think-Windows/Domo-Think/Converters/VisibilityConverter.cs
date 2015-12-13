using System;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Data;

/*--------------------------------------------------------
 * VisibilityConverter.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 13/12/2015 14:00:03
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.Converters
{
    public class VisibilityConverter : IValueConverter
    {
        public Object Convert(Object value, Type targetType, Object parameter, String language)
        {
            return (Boolean)value ? Visibility.Visible : Visibility.Collapsed;
        }

        public Object ConvertBack(Object value, Type targetType, Object parameter, String language)
        {
            throw new NotImplementedException();
        }
    }
}
