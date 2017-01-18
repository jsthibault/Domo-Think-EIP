using DomoThink.API;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * AppContext.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 22/10/2016 17:47:05
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink
{
    public static class AppContext
    {
        private static UserService userService;
        private static DeviceService deviceService;
        private static DirectiveService directiveService;
        private static PluginService pluginService;
        private static StoreService storeService;
        private static BoxService boxService;

        public static UserService UserService
        {
            get
            {
                if (userService == null)
                    userService = new UserService();

                return userService;
            }
        }

        public static DeviceService DeviceService
        {
            get
            {
                if (deviceService == null)
                    deviceService = new DeviceService(App.ApiClient);

                return deviceService;
            }
        }

        public static DirectiveService DirectiveService
        {
            get
            {
                if (directiveService == null)
                    directiveService = new DirectiveService(App.ApiClient);

                return directiveService;
            }
        }

        public static PluginService PluginService
        {
            get
            {
                if (pluginService == null)
                    pluginService = new PluginService(App.ApiClient);

                return pluginService;
            }
        }

        public static StoreService StoreService
        {
            get
            {
                if (storeService == null)
                    storeService = new StoreService(App.ApiClient);

                return storeService;
            }
        }

        public static BoxService BoxService
        {
            get
            {
                if (boxService == null)
                    boxService = new BoxService(App.ApiClient);

                return boxService;
            }
        }

        public static void Dispose()
        {
        }
    }
}
