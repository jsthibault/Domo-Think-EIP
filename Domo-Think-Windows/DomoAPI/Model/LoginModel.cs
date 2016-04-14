using System;
using System.Runtime.Serialization;
using System.Text;

/*--------------------------------------------------------
 * Login.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 11/04/2016 17:33:34
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoAPI.Model
{
    [DataContract]
    public class LoginModel : IEquatable<LoginModel>
    {
        #region FIELDS
        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the login username.
        /// </summary>
        [DataMember(Name = "id", EmitDefaultValue = false)]
        public String Id { get; set; }

        /// <summary>
        /// Gets or sets the login password.
        /// </summary>
        [DataMember(Name = "password", EmitDefaultValue = false)]
        public String Password { get; set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new empty login data contract.
        /// </summary>
        public LoginModel()
            : this(String.Empty, String.Empty)
        { }

        /// <summary>
        /// Creates a new login data contract.
        /// </summary>
        /// <param name="id">Id</param>
        /// <param name="password">Password</param>
        public LoginModel(String id, String password)
        {
            this.Id = id;
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

            _sb.AppendLine("class Login {\n");
            _sb.Append("  Id: ").Append(this.Id).Append("\n");
            _sb.Append("  Password: ").Append(this.Password).Append("\n");
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
            return this.Equals(obj as LoginModel);
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="other">Object to be compared</param>
        /// <returns>Boolean</returns>
        public Boolean Equals(LoginModel other)
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

    public class LoginResponse
    {
    }
}
