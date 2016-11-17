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
        public const string USER_CONNECT = API_PREFIX + "/login";
        public const string USER_FORGOT_PASSWORD = API_PREFIX + "/user/forgotten_password/";

        // Devices
        public const string DEVICE_ROUTE = API_PREFIX + "/devices";

        // Directives
        public const string GET_DIRECTIVES = API_PREFIX + "/directives";

        // Plugins
        public const string GET_PLUGINS = API_PREFIX + "/plugin";

        // Users
        public const string GET_ACCOUNTS = API_PREFIX + "/users";

        // Store
        public const string GET_PLUGINS_STORE = API_PREFIX + "/store";

        public const string GET_PLUGINS_STORE_COMMENTS = API_PREFIX + "/store/{0}/comments";
        public const string POST_PLUGINS_STORE_COMMENTS = API_PREFIX + "/store/{0}/comments";
    }
}
