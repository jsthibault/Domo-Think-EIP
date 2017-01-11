using DAL.Model;
using System;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Data;

/*--------------------------------------------------------
 * AccountModeConverter.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 14/08/2016 15:40:56
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Converters
{
    public class EditorModeConverter : IValueConverter
    {
        public Object Convert(Object value, Type targetType, Object parameter, String language)
        {
            EditorMode _mode = (EditorMode)value;
            EditorMode _modeWanted = (EditorMode)Enum.Parse(typeof(EditorMode), parameter.ToString());

            if (_mode == _modeWanted)
                return Visibility.Visible;
            return Visibility.Collapsed;
        }

        public Object ConvertBack(Object value, Type targetType, Object parameter, String language)
        {
            throw new NotImplementedException();
        }
    }
}
