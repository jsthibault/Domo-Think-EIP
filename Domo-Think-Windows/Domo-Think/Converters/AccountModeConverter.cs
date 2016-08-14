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
    public class AccountModeConverter : IValueConverter
    {
        public Object Convert(Object value, Type targetType, Object parameter, String language)
        {
            AccountMode _mode = (AccountMode)value;
            AccountMode _modeWanted = (AccountMode)Enum.Parse(typeof(AccountMode), parameter.ToString());

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
