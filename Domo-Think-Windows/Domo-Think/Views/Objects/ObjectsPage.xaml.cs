using DomoThink.Controls;
using System;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace DomoThink.Views.Objects
{
    public sealed partial class ObjectsPage : DomoPage
    {
        public ObjectsPage()
        {
            this.InitializeComponent();
        }

        private void OBJECTS_LIST_SelectionChanged(Object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var lv = sender as ListView;
                if (e.RemovedItems.Count > 0)
                {
                    foreach (var item in e.RemovedItems)
                    {
                        var container = lv.ContainerFromItem(item) as ListViewItem;
                        var panel = container.ContentTemplateRoot as Controls.ObjectListView;
                        panel.SetInViewMode();
                    }
                }
                if (e.AddedItems.Count > 0)
                {
                    foreach (var item in e.AddedItems)
                    {
                        var container = lv.ContainerFromItem(item) as ListViewItem;
                        var panel = container.ContentTemplateRoot as Controls.ObjectListView;
                        panel.SetInEditMode();
                    }
                }
            }
            catch { }
        }
    }
}
