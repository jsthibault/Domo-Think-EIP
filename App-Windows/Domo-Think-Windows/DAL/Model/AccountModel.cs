using System;
using System.Runtime.Serialization;
using System.Text;
using System.Windows.Input;

/*--------------------------------------------------------
 * UserModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 02/06/2016 13:43:51
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DAL.Model
{
    public enum EditorMode
    {
        Create,
        Edit
    }

    [DataContract]
    public class AccountModel
    {
        /// <summary>
        /// Gets or sets the username.
        /// </summary>
        [DataMember(Name = "login", EmitDefaultValue = false)]
        public String Username { get; set; }

        /// <summary>
        /// Gets or sets the user id.
        /// </summary>
        [DataMember(Name = "userId", EmitDefaultValue = false)]
        public String UserId { get; set; }

        /// <summary>
        /// Gets or sets the old password.
        /// </summary>
        [DataMember(Name = "oldPassword", EmitDefaultValue = false)]
        public String OldPassword { get; set; }
        
        /// <summary>
        /// Gets or sets the new password.
        /// </summary>
        [DataMember(Name = "newPassword", EmitDefaultValue = false)]
        public String NewPassword { get; set; }

        /// <summary>
        /// Gets or sets the password.
        /// </summary>
        [DataMember(Name = "password", EmitDefaultValue = false)]
        public String Password { get; set; }

        /// <summary>
        /// Gets or sets the password confirmation.
        /// </summary>
        [DataMember(Name = "confirmPassword", EmitDefaultValue = false)]
        public String PasswordConfirmation { get; set; }

        /// <summary>
        /// Gets or sets the box key.
        /// </summary>
        [DataMember(Name = "boxKey", EmitDefaultValue = false)]
        public String BoxKey { get; set; }

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
        /// Creates a new empty account model.
        /// </summary>
        public AccountModel()
            : this("", "")
        { }

        /// <summary>
        /// Creates a new account model.
        /// </summary>
        /// <param name="username">Account username</param>
        /// <param name="password">Account password</param>
        public AccountModel(String username, String password)
        {
            this.Username = username;
            this.Password = password;
        }

        /// <summary>
        /// Creates a new account model.
        /// </summary>
        /// <param name="username">Account username</param>
        /// <param name="password">Account password</param>
        public AccountModel(String username, String password, String passwordConfirmation, String boxKey)
        {
            this.Username = username;
            this.Password = password;
            this.PasswordConfirmation = passwordConfirmation;
            this.BoxKey = boxKey;
        }
        
        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override String ToString()
        {
            StringBuilder _sb = new StringBuilder();

            _sb.AppendLine("class AccountModel {");
            _sb.Append("    Id: ").Append(this.Username).Append("\n");
            _sb.Append("    Password: ").Append(this.Password).Append("\n");
            _sb.Append("    Password confirmation: ").Append(this.PasswordConfirmation).Append("\n");
            _sb.Append("    BoxKey: ").Append(this.BoxKey).Append("\n");
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

            return (this.Username == other.Username) && (this.Password == other.Password);
        }

        public override Int32 GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
