using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;


/*--------------------------------------------------------
 * DirectiveModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 14/04/2016 13:32:25
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DAL.Model
{
    [DataContract]
    public class DirectiveModel : IEquatable<DirectiveModel>
    {
        /// <summary>
        /// Gets or sets the Id of the directive.
        /// </summary>
        [DataMember(Name = "idDirective", EmitDefaultValue = false)]
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the name of the directive.
        /// </summary>
        [DataMember(Name = "name", EmitDefaultValue = false)]
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets the directive's creator Id.
        /// </summary>
        [DataMember(Name = "creatorId", EmitDefaultValue = false)]
        public int CreatorId { get; set; }

        /// <summary>
        /// Gets or sets the directive's parent object Id.
        /// </summary>
        [DataMember(Name = "deviceId", EmitDefaultValue = true)]
        public int ObjectId { get; set; }

        /// <summary>
        /// Gets or sets the directive's action Id.
        /// </summary>
        [DataMember(Name = "actionId", EmitDefaultValue = true)]
        public int ActionId { get; set; }

        [DataMember(Name = "periodicityType", EmitDefaultValue = false)]
        public int PeriodicityType { get; set; }

        [DataMember(Name = "periodicityData", EmitDefaultValue = false)]
        public string PeriodicityData { get; set; }

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
        

        public DirectiveModel(int id, string name, int creatorId, int objectId, int actionId, int periodicityType)
        {
            this.Id = id;
            this.Name = name;
            this.CreatorId = creatorId;
            this.ObjectId = objectId;
            this.ActionId = actionId;
            this.PeriodicityType = periodicityType;
            //this.PeriodicityData = new PeriodicityModel(0, "");
        }
        
        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();

            sb.AppendLine("class DirectiveModel {");
            sb.Append("  Id: ").Append(Id).Append("\n");
            sb.Append("  Name: ").Append(Name).Append("\n");
            sb.Append("  CreatorId: ").Append(CreatorId).Append("\n");
            sb.Append("  ObjectId: ").Append(ObjectId).Append("\n");
            sb.Append("  ActionId: ").Append(ActionId).Append("\n");
            sb.AppendLine("}");

            return sb.ToString();
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="other">Object to be compared</param>
        /// <returns>Boolean</returns>
        public override bool Equals(object obj)
        {
            return this.Equals(obj as DirectiveModel);
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="other">Object to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(DirectiveModel other)
        {
            if (other == null)
                return false;

            return this.Id == other.Id
                && this.Name == other.Name
                && this.ObjectId == other.ObjectId
                && this.ActionId == other.ActionId
                && this.CreatorId == other.CreatorId;
        }

        /// <summary>
        /// Gets the object hash code.
        /// </summary>
        /// <returns></returns>
        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
