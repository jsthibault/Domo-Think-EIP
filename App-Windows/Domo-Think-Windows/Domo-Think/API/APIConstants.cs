using System;

/*--------------------------------------------------------
 * APIConstants.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 29/04/2016 17:28:04
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.API
{
    public class APIConstants
    {
#if DEBUG
        public const String API_URL = "http://89.156.153.245:4242/"; /*"http://localhost:2977/";*/
#else
        public const String API_URL = "http://89.156.153.245:4242/";
#endif

        public const String API_URL_FILIPE_PI = "http://86.70.224.180:4243";

        public const string API_URL_LOCAL = "http://127.0.0.1:4242";
    }
}
