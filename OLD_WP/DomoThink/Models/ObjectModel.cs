using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * ObjectModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 30/10/2015 11:24:36
 * 
 * Notes:
 * Represents an object like a TV, lights, etc...
 * -------------------------------------------------------*/

namespace DomoThink.Models
{
    public class ObjectModel
    {
        /// <summary>
        /// Gets or sets the name of the object.
        /// </summary>
        public String Name { get; set; }

        /// <summary>
        /// Gets or sets the state of the object.
        /// </summary>
        public Boolean Enabled { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="name"></param>
        /// <param name="enabled"></param>
        public ObjectModel(String name, Boolean enabled)
        {
            this.Name = name;
            this.Enabled = enabled;
        }
    }
}
