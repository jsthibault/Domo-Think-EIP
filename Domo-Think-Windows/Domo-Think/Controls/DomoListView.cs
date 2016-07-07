using System;
using Windows.UI.Xaml.Controls;

namespace DomoThink.Controls
{
    public class DomoListView : ListView
    {
        /// <summary>
        /// Creates a new DomoListView with a SelectionChanged event already created.
        /// </summary>
        public DomoListView()
        {
            this.SelectionChanged += DomoListView_SelectionChanged;
        }

        private void DomoListView_SelectionChanged(Object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var lv = sender as ListView;
                if (e.RemovedItems.Count > 0)
                {
                    foreach (var item in e.RemovedItems)
                    {
                        var container = lv.ContainerFromItem(item) as ListViewItem;
                        var panel = container.ContentTemplateRoot as Expander.Expander;
                        panel.IsVisible = Windows.UI.Xaml.Visibility.Collapsed;
                    }
                }
                if (e.AddedItems.Count > 0)
                {
                    foreach (var item in e.AddedItems)
                    {
                        var container = lv.ContainerFromItem(item) as ListViewItem;
                        var panel = container.ContentTemplateRoot as Expander.Expander;
                        panel.IsVisible = Windows.UI.Xaml.Visibility.Visible;
                    }
                }
            }
            catch { }
        }
    }
}
