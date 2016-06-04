using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Media;


/*--------------------------------------------------------
 * AlternateListView.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 04/06/2016 22:49:12
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Controls
{
    public class AlternateListView : ListView
    {
        protected override void PrepareContainerForItemOverride(DependencyObject element, Object item)
        {
            base.PrepareContainerForItemOverride(element, item);

            var listViewItem = element as ListViewItem;
            if (listViewItem != null)
            {
                var index = IndexFromContainer(element);

                if ((index + 1) % 2 == 1)
                {
                    listViewItem.Background = new SolidColorBrush(Colors.White);
                }
                else
                {
                    listViewItem.Background = new SolidColorBrush(Colors.LightGray);
                }
            }

        }
    }
}
