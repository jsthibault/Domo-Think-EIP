using System;
using System.IO;
using System.Runtime.Serialization;
using System.Text;
using System.Windows.Input;

/*--------------------------------------------------------
 * DeviceModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 15/04/2016 09:35:36
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DAL.Model
{
    [DataContract]
    public class DeviceModel : IEquatable<DeviceModel>
    {
        /// <summary>
        /// Gets or sets the Id of the object.
        /// </summary>
        [DataMember(Name = "idDevice", EmitDefaultValue = false)]
        public Int32 Id { get; set; }

        /// <summary>
        /// Gets or sets the name of the object.
        /// </summary>
        [DataMember(Name = "name", EmitDefaultValue = false)]
        public String Name { get; set; }

        /// <summary>
        /// Gets ro sets the description of the object.
        /// </summary>
        [DataMember(Name = "description", EmitDefaultValue = false)]
        public String Description { get; set; }

        /// <summary>
        /// Gets or sets the activation state of the object.
        /// </summary>
        [DataMember(Name = "state", EmitDefaultValue = false)]
        public Boolean IsActive { get; set; }

        /// <summary>
        /// Gets or sets the add command.
        /// </summary>
        [IgnoreDataMember]
        public ICommand AddCommand { get; set; }

        /// <summary>
        /// Gets or sets the edit command.
        /// </summary>
        [IgnoreDataMember]
        public ICommand EditCommand { get; set; }

        /// <summary>
        /// Gets or sets the delete command.
        /// </summary>
        [IgnoreDataMember]
        public ICommand DeleteCommand { get; set; }
        
        /// <summary>
        /// Creates a new ObjectModel instance.
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        public DeviceModel(Int32 id, String name)
        {
            if (String.IsNullOrEmpty(name))
                throw new InvalidDataException("The name of the directive cannot by empty.");

            this.Id = id;
            this.Name = name;
        }
        
        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            StringBuilder _sb = new StringBuilder();

            _sb.AppendLine("class ObjectModel {");
            _sb.Append("  Id: ").Append(this.Id).Append("\n");
            _sb.Append("  Name: ").Append(this.Name).Append("\n");
            _sb.Append("  Description: ").Append(this.Description).Append("\n");
            _sb.Append("  Status: ").Append(this.IsActive).Append("\n");
            _sb.AppendLine("}");

            return _sb.ToString();
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="other">Object to be compared</param>
        /// <returns>Boolean</returns>
        public override Boolean Equals(Object obj)
        {
            return this.Equals(obj as DirectiveModel);
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="other">Object to be compared</param>
        /// <returns>Boolean</returns>
        public Boolean Equals(DeviceModel other)
        {
            if (other == null)
                return false;

            return this.Id == other.Id
                && this.Name == other.Name;
        }

        /// <summary>
        /// Gets the object hash code.
        /// </summary>
        /// <returns></returns>
        public override Int32 GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
