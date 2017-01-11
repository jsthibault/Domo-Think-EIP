using DomoThink.Navigation;
using DomoThink.Services;
using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;

namespace DomoThink.MVVM
{
    public abstract class ViewModelBase : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        /// <summary>
        /// On property changed event.
        /// </summary>
        /// <param name="propName"></param>
        protected void OnPropertyChanged([CallerMemberName] string propName = null)
        {
            if (this.PropertyChanged != null)
                this.PropertyChanged(this, new PropertyChangedEventArgs(propName));
        }

        /// <summary>
        /// Notify and sets the property value.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="storage">Property reference</param>
        /// <param name="value">New value</param>
        /// <param name="propertyName">Property name</param>
        /// <returns></returns>
        protected bool NotifyPropertyChanged<T>(ref T storage, T value, [CallerMemberName] String propertyName = null)
        {
            if (Equals(storage, value) == true)
                return false;

            storage = value;
            this.OnPropertyChanged(propertyName);

            return true;
        }

        private Object previousDataContext;

        /// <summary>
        /// Push the View assosiated with this ViewModel.
        /// </summary>
        /// <param name="parameter"></param>
        public void Push(object parameter = null)
        {
            Type _pageType = ViewFactory.Get(this.GetType());

            Page _currentPage = NavigationService.GetFrame().Content as Page;
            this.previousDataContext = _currentPage?.DataContext;

            Page _page = NavigationService.Navigate(_pageType).Content as Page;
            _page.NavigationCacheMode = NavigationCacheMode.Required;
            _page.DataContext = this;
            _page.ApplyTemplate();

            this.Refresh(parameter);
        }

        /// <summary>
        /// Pop the actual view and refresh the data.
        /// </summary>
        /// <param name="parameter"></param>
        public void Pop(Object parameter = null)
        {
            (NavigationService.GoBack().Content as Page).DataContext = previousDataContext;
            (previousDataContext as ViewModelBase).Refresh(parameter);
        }

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public abstract void Refresh(object parameter);
    }
}
