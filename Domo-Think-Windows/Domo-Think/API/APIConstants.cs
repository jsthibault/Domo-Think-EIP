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
        public const String API_URL = "http://89.156.144.51:4242/"; /*"http://localhost:2977/";*/
#else
        public const String API_URL = "http://89.156.151.77:4242/";
#endif
    }
}
