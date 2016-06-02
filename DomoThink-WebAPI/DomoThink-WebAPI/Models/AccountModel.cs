using System;
using System.Runtime.Serialization;
using System.Text;

/*--------------------------------------------------------
 * UserModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 02/06/2016 13:43:51
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink_WebAPI.Models
{
    public class AccountModel
    {
        #region CONSTANTS



        #endregion

        #region ENUMS



        #endregion

        #region FIELDS



        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the username.
        /// </summary>
        [DataMember(Name = "username", EmitDefaultValue = false)]
        public String Id { get; set; }

        /// <summary>
        /// Gets or sets the password.
        /// </summary>
        [DataMember(Name = "password", EmitDefaultValue = false)]
        public String Password { get; set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new empty account model.
        /// </summary>
        public AccountModel()
            : this(String.Empty, String.Empty)
        { }

        /// <summary>
        /// Creates a new account model.
        /// </summary>
        /// <param name="username">Account username</param>
        /// <param name="password">Account password</param>
        public AccountModel(String username, String password)
        {
            this.Id = username;
            this.Password = password;
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

            _sb.AppendLine("class AccountModel {\n");
            _sb.Append("    Id: ").Append(this.Id).Append("\n");
            _sb.Append("    Password: ").Append(this.Password).Append("\n");
            _sb.AppendLine("}\n");

            return _sb.ToString();
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="obj">Object to be compared</param>
        /// <returns>Boolean</returns>
        public override Boolean Equals(Object obj)
        {
            return this.Equals(obj as AccountModel);
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="other">Object to be compared</param>
        /// <returns>Boolean</returns>
        public Boolean Equals(AccountModel other)
        {
            if (other == null)
                return false;

            return (this.Id == other.Id) && (this.Password == other.Password);
        }

        public override Int32 GetHashCode()
        {
            return base.GetHashCode();
        }

        #endregion
    }
}
