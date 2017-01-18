using System;

/*--------------------------------------------------------
 * ApiRoutes.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 02/06/2016 12:09:12
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.API
{
    public class ApiRoutes
    {
        public const string API_PREFIX = "";

        // Users
        public const string USER_CONNECT = API_PREFIX + "/login/";
        public const string USER_FORGOT_PASSWORD = API_PREFIX + "/user/forgotten_password/";

        // Devices
        public const string DEVICE_ROUTE = API_PREFIX + "/devices/";
        public const string DEVICE_ROUTE_ID = API_PREFIX + "/devices/{0}";
        public const string DEVICE_SCAN_ROUTE = API_PREFIX + "/devices/scan/";
        public const string DEVICE_ROUTE_CHANGE_STATUS = API_PREFIX + "/devices/changeStatus/";

        // Directives
        public const string DIRECTIVES = API_PREFIX + "/directives/";
        public const string DIRECTIVES_ID = API_PREFIX + "/directives/{0}";

        // Plugins
        public const string GET_PLUGINS = API_PREFIX + "/plugin/";

        // Users
        public const string GET_ACCOUNTS = API_PREFIX + "/users/";

        // Store
        public const string GET_PLUGINS_STORE = API_PREFIX + "/store/";

        public const string GET_PLUGINS_STORE_COMMENTS = API_PREFIX + "/store/{0}/comments/";
        public const string POST_PLUGINS_STORE_COMMENTS = API_PREFIX + "/store/{0}/comments/";
    }
}
