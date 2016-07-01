using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace DomoThink.Controls
{
    public sealed partial class ObjectListView : UserControl
    {
        public ObjectListView()
        {
            this.InitializeComponent();
        }

        public void SetInEditMode()
        {
            VisualStateManager.GoToState(this, "Selected", true);
        }

        public void SetInViewMode()
        {
            VisualStateManager.GoToState(this, "Normal", true);
        }
    }
}
