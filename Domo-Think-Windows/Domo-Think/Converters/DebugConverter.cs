using System;
using System.Diagnostics;
using Windows.UI.Xaml.Data;


/*--------------------------------------------------------
 * DebugConverter.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 12/12/2015 16:50:12
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Converters
{
    public class DebugConverter : IValueConverter
    {
        public Object Convert(Object value, Type targetType, Object parameter, String language)
        {
            Debug.WriteLine("Value = {0}", value);

            return value;
        }

        public Object ConvertBack(Object value, Type targetType, Object parameter, String language)
        {
            return value;
        }
    }
}
