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
        #region FIELDS
        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the Id of the directive.
        /// </summary>
        [DataMember(Name = "id", EmitDefaultValue = false)]
        public Double? Id { get; set; }

        /// <summary>
        /// Gets or sets the name of the directive.
        /// </summary>
        [DataMember(Name = "name", EmitDefaultValue = false)]
        public String Name { get; set; }

        /// <summary>
        /// Gets or sets the directive's creator Id.
        /// </summary>
        [DataMember(Name = "creatorId", EmitDefaultValue = false)]
        public Double? CreatorId { get; set; }

        /// <summary>
        /// Gets or sets the directive's parent object Id.
        /// </summary>
        [DataMember(Name = "objectId", EmitDefaultValue = false)]
        public Double? ObjectId { get; set; }

        /// <summary>
        /// Gets or sets the directive's action Id.
        /// </summary>
        [DataMember(Name = "actionId", EmitDefaultValue = false)]
        public Double? ActionId { get; set; }

        [DataMember(Name = "periodicity", EmitDefaultValue = false)]
        public PeriodicityModel Periodicity { get; set; }

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

        #endregion

        #region CONSTRUCTORS

        public DirectiveModel(Double id, String name, Double creatorId, Double objectId, Double actionId)
        {
            if (String.IsNullOrEmpty(name))
                throw new InvalidDataException("The name of the directive cannot by empty.");

            this.Id = id;
            this.Name = name;
            this.CreatorId = creatorId;
            this.ObjectId = objectId;
            this.ActionId = actionId;
            this.Periodicity = new PeriodicityModel();
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            StringBuilder _sb = new StringBuilder();

            _sb.AppendLine("class DirectiveModel {");
            _sb.Append("  Id: ").Append(Id).Append("\n");
            _sb.Append("  Name: ").Append(Name).Append("\n");
            _sb.Append("  CreatorId: ").Append(CreatorId).Append("\n");
            _sb.Append("  ObjectId: ").Append(ObjectId).Append("\n");
            _sb.Append("  ActionId: ").Append(ActionId).Append("\n");
            _sb.Append("  Periodicity: ").Append(this.Periodicity.ToString()).Append("\n");
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
        public Boolean Equals(DirectiveModel other)
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
        public override Int32 GetHashCode()
        {
            return base.GetHashCode();
        }

        #endregion
    }
}
