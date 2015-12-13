using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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

namespace Domo_Think.Navigation
{
    public static class NavigationService
    {
        private static Object syncRoot = new Object();
        private static Frame frame;

        public static void InitializeContentFrame(Frame contentFrame)
        {
            frame = contentFrame;
        }

        public static void Navigate(Type page)
        {
            lock (syncRoot)
            {
                Navigate(page, null);
            }
        }

        public static void Navigate(Type page, Object parameter)
        {
            lock (syncRoot)
            {
                frame.Navigate(page, parameter);
            }
        }

        public static void GoBack()
        {
            lock (syncRoot)
            {
                if (CanGoBack())
                    frame.GoBack();
            }
        }

        public static Boolean CanGoBack()
        {
            lock (syncRoot)
            {
                return frame == null ? false : frame.CanGoBack;
            }
        }
    }
}
