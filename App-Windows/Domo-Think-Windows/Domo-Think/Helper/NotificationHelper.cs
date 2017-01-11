using System;
using Windows.UI.Notifications;

/*--------------------------------------------------------
 * NotificationHelper.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 14/08/2016 16:25:58
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Helper
{
    public static class NotificationHelper
    {
        /// <summary>
        /// Show a toast notification to the user.
        /// </summary>
        /// <param name="title">Toast title</param>
        /// <param name="stringContent">Toast content</param>
        public static void ShowToastNotification(string title, string stringContent)
        {
            ToastNotifier ToastNotifier = ToastNotificationManager.CreateToastNotifier();
            Windows.Data.Xml.Dom.XmlDocument toastXml = ToastNotificationManager.GetTemplateContent(ToastTemplateType.ToastText02);
            Windows.Data.Xml.Dom.XmlNodeList toastNodeList = toastXml.GetElementsByTagName("text");
            toastNodeList.Item(0).AppendChild(toastXml.CreateTextNode(title));
            toastNodeList.Item(1).AppendChild(toastXml.CreateTextNode(stringContent));
            Windows.Data.Xml.Dom.IXmlNode toastNode = toastXml.SelectSingleNode("/toast");
            Windows.Data.Xml.Dom.XmlElement audio = toastXml.CreateElement("audio");
            audio.SetAttribute("src", "ms-winsoundevent:Notification.SMS");

            ToastNotification toast = new ToastNotification(toastXml);
            toast.ExpirationTime = DateTime.Now.AddSeconds(4);
            ToastNotifier.Show(toast);
        }
    }
}
