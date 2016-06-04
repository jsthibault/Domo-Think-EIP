using System;
using Windows.UI;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Media;

/*--------------------------------------------------------
 * VisibilityConverter.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 13/12/2015 14:00:03
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Converters
{
    public class ListViewItemBackgroundConverter : IValueConverter
    {
        public Object Convert(Object value, Type targetType, Object parameter, String language)
        {
            ListViewItem item = (ListViewItem)value;
            ListView listView = ItemsControl.ItemsControlFromItemContainer(item) as ListView;

            // Get the index of a ListViewItem
            int index =
                listView.ItemContainerGenerator.IndexFromContainer(item);

            if (index % 2 == 0)
            {
                return new SolidColorBrush(Colors.LightGray);
            }
            else
            {
                return new SolidColorBrush(Colors.White);
            }
        }

        public Object ConvertBack(Object value, Type targetType, Object parameter, String language)
        {
            throw new NotImplementedException();
        }
    }
}
