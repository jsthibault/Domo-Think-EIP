using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Data;

/*--------------------------------------------------------
 * BoolToVisibilityConverter.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 10/10/2015 23:03:14
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Converters
{
    public class BoolToVisibilityConverter : IValueConverter
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
