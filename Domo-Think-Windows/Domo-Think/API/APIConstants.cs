﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


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
        public const String API_URL = "http://localhost:2977/"; //"http://89.156.151.77:4242/";
#else
        public const String API_URL = "";
#endif
    }
}