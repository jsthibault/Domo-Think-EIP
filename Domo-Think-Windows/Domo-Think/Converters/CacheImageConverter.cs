using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Media.Imaging;


/*--------------------------------------------------------
 * CacheImageConverter.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 22/04/2016 12:15:57
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Converters
{
    public class CacheImageConverter : IValueConverter
    {
        public Object Convert(Object value, Type targetType, Object parameter, String language)
        {
            BitmapImage _image = null;

            try
            {
                if (value == null || String.IsNullOrEmpty(value.ToString()))
                {
                    Uri _defaultUri = new Uri("ms-appx://DomoThink/Assets/windows_store-512.png");

                    _image = new BitmapImage(_defaultUri);
                }
            }
            catch (Exception e)
            {
            }

            return _image;
        }

        public Object ConvertBack(Object value, Type targetType, Object parameter, String language)
        {
            return value;
        }
    }
}
