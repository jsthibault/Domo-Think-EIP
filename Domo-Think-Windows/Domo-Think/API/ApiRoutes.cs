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
        public const String API_PREFIX = "/api";
        public const String USER_CONNECT = API_PREFIX + "/user/auth";

        // Objects
        public const String GET_OBJECTS = API_PREFIX + "/objects/getObjects";
        public const String GET_OBJECT = API_PREFIX + "/objects/getObject";
        public const String ADD_OBJECT = API_PREFIX + "/objects/addObject";
        public const String UPDATE_OBJECT = API_PREFIX + "/objects/updateObject";
        public const String DELETE_OBJECT = API_PREFIX + "/objects/deleteObject";

        // Directives
        public const String GET_DIRECTIVES = API_PREFIX + "/directives/getDirectives";
        public const String GET_DIRECTIVE = API_PREFIX + "/directives/getDirective";
        public const String ADD_DIRECTIVE = API_PREFIX + "/directives/addDirective";
        public const String UPDATE_DIRECTIVE = API_PREFIX + "/directives/updateDirective";
        public const String DELETE_DIRECTIVE = API_PREFIX + "/directives/deleteDirective";

        // Plugins
        public const String GET_PLUGINS = API_PREFIX + "/plugins/getPlugins";

        // Users
        public const String GET_ACCOUNTS = API_PREFIX + "/account/getAccounts";
    }
}
