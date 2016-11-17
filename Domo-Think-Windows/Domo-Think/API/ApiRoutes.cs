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
        public const String API_PREFIX = "";

        // Users
        public const String USER_CONNECT = API_PREFIX + "/login";
        public const String USER_FORGOT_PASSWORD = API_PREFIX + "/user/forgotten_password/";

        // Devices
        public const String DEVICE_ROUTE = API_PREFIX + "/devices";

        // Directives
        public const String GET_DIRECTIVES = API_PREFIX + "/directives";

        // Plugins
        public const String GET_PLUGINS = API_PREFIX + "/plugin";

        // Users
        public const String GET_ACCOUNTS = API_PREFIX + "/users";
    }
}
