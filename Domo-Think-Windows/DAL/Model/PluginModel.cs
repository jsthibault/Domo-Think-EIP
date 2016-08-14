﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;


/*--------------------------------------------------------
 * PluginModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 22/04/2016 11:32:04
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DAL.Model
{
    [DataContract]
    public class PluginModel
    {
        #region PROPERTIES

        /// <summary>
        /// Gets or sets the Id of the plugin.
        /// </summary>
        [DataMember(Name = "id", EmitDefaultValue = false)]
        public Int32 Id { get; set; }

        /// <summary>
        /// Gets or sets the Name of the plugin.
        /// </summary>
        [DataMember(Name = "name", EmitDefaultValue = false)]
        public String Name { get; set; }

        /// <summary>
        /// Gets or sets the description of the plugin.
        /// </summary>
        [DataMember(Name = "description", EmitDefaultValue = false)]
        public String Description { get; set; }

        /// <summary>
        /// Gets or sets the activation state of the plugin.
        /// </summary>
        [DataMember(Name = "activate", EmitDefaultValue = false)]
        public Boolean IsActive { get; set; }

        /// <summary>
        /// Gets or sets the Image url.
        /// </summary>
        /// <remarks>
        /// This image is an url. If the image is not in the cache, it will be downloaded.
        /// </remarks>
        [DataMember(Name = "image", EmitDefaultValue = false)]
        public String Image { get; set; }

        /// <summary>
        /// Gets or sets the Rating of the plugin.
        /// </summary>
        [DataMember(Name = "rating", EmitDefaultValue = false)]
        public Single Rating { get; set; }

        /// <summary>
        /// Gets or sets the installed state of the plugin.
        /// </summary>
        [DataMember(Name = "installed", EmitDefaultValue = false)]
        public Boolean Installed { get; set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a default plugin model instance.
        /// </summary>
        public PluginModel()
            : this(-1, String.Empty, 0, false)
        { }

        /// <summary>
        /// Creates a plugin model.
        /// </summary>
        /// <param name="id">Id of the plugin.</param>
        /// <param name="name">Name of the plugin.</param>
        /// <param name="rate">Rate of the plugin.</param>
        /// <param name="installed">State of the plugin.</param>
        public PluginModel(Int32 id, String name, Single rate, Boolean installed)
        {
            this.Id = id;
            this.Name = name;
            this.Rating = Rating;
            this.Installed = installed;
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override String ToString()
        {
            StringBuilder _sb = new StringBuilder();

            _sb.AppendLine("class Plugin {");
            _sb.Append("    Id: ").Append(this.Id).Append("\n");
            _sb.Append("    Name: ").Append(this.Name).Append("\n");
            _sb.Append("    Description: ").Append(this.Description).Append("\n");
            _sb.Append("    IsActive: ").Append(this.IsActive).Append("\n");
            _sb.Append("    Rating: ").Append(this.Rating).Append("\n");
            _sb.Append("    Installed: ").Append(this.Installed).Append("\n");
            _sb.AppendLine("}\n");

            return _sb.ToString();
        }

        #endregion
    }
}