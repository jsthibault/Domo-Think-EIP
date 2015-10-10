using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * LoginModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 10/10/2015 14:35:58
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Models
{
    public class LoginModel
    {
        /// <summary>
        /// Gets or sets the login id.
        /// </summary>
        public String Id { get; set; }

        /// <summary>
        /// Gets or sets the login password.
        /// </summary>
        public String Password { get; set; }
    }
}
