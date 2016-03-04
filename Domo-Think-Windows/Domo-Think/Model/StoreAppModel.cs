using System;

/*--------------------------------------------------------
 * StoreAppModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 29/12/2015 13:59:18
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.Model
{
    public class StoreAppModel
    {
        /// <summary>
        /// Gets or sets the app id.
        /// </summary>
        public Int32 Id { get; set; }

        /// <summary>
        /// Gets or sets the app name.
        /// </summary>
        public String Name { get; set; }

        /// <summary>
        /// Gets or sets the app rate.
        /// </summary>
        public Int32 Rate { get; set; }
    }
}
