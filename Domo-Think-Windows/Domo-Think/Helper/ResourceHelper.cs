using System;
using Windows.ApplicationModel.Resources;

/*--------------------------------------------------------
 * ResourceHelper.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 14/08/2016 16:26:56
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Helper
{
    public static class ResourceHelper
    {
        private static ResourceLoader loader = new ResourceLoader();

        static ResourceHelper() { }

        /// <summary>
        /// Gets a string from the resource name.
        /// </summary>
        /// <param name="resourceName"></param>
        /// <returns></returns>
        public static String GetString(String resourceName)
        {
            return loader.GetString(resourceName);
        }
    }
}
