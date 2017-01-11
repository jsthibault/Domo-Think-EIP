using DomoThink.MVVM;
using DomoThink.Services;
using System;
using Windows.UI.Xaml.Controls;

/*--------------------------------------------------------
 * NavigationService.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 12/12/2015 17:17:41
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Navigation
{
    public static class NavigationService
    {
        private static Object syncRoot = new Object();
        private static Frame frame;

        /// <summary>
        /// Initialize the content frame of the Navigation service.
        /// </summary>
        /// <param name="contentFrame"></param>
        public static void InitializeContentFrame(Frame contentFrame)
        {
            frame = contentFrame;
        }

        /// <summary>
        /// Navigate to the type passed as parameter.
        /// </summary>
        /// <param name="type"></param>
        /// <param name="parameter"></param>
        public static Frame Navigate(Type type, Object parameter = null)
        {
            frame.Navigate(type, parameter);

            return frame;
        }

        /// <summary>
        /// Gets the current frame.
        /// </summary>
        /// <returns></returns>
        public static Frame GetFrame()
        {
            lock (syncRoot)
            {
                return frame;
            }
        }

        /// <summary>
        /// Gets the current view model.
        /// </summary>
        /// <returns></returns>
        public static ViewModelBase GetCurrentViewModel()
        {
            lock (syncRoot)
            {
                return (frame.Content as Page).DataContext as ViewModelBase;
            }
        }

        /// <summary>
        /// Go back to the previous page.
        /// </summary>
        public static Frame GoBack()
        {
            lock (syncRoot)
            {
                if (CanGoBack())
                    frame.GoBack();

                return frame;
            }
        }

        /// <summary>
        /// Check if the navigation service can go back.
        /// </summary>
        /// <returns></returns>
        public static Boolean CanGoBack()
        {
            lock (syncRoot)
            {
                return frame == null ? false : frame.CanGoBack;
            }
        }
    }
}
