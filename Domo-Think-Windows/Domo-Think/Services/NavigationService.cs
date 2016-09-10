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
        /// Navigate to the TViewModel.
        /// </summary>
        /// <typeparam name="TViewModel"></typeparam>
        /// <param name="parameter"></param>
        public static void Navigate<TViewModel>(Object parameter = null)
        {
            Navigate(typeof(TViewModel), parameter);
        }

        /// <summary>
        /// Navigate to the type passed as parameter.
        /// </summary>
        /// <param name="type"></param>
        /// <param name="parameter"></param>
        public static void Navigate(Type type, Object parameter = null)
        {
            Type _viewType = ViewFactory.Get(type);

            frame.Navigate(_viewType, parameter);
        }

        /// <summary>
        /// Go back to the previous page.
        /// </summary>
        public static void GoBack()
        {
            lock (syncRoot)
            {
                if (CanGoBack())
                    frame.GoBack();
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
