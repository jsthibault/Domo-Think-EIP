using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * Periodicity.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 20/07/2016 17:30:06
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DAL.Model
{
    [DataContract]
    public class PeriodicityModel
    {
        #region FIELDS



        #endregion

        #region PROPERTIES

        [DataMember(Name = "type", EmitDefaultValue = false)]
        public Int32 Type { get; set; }

        [DataMember(Name = "name", EmitDefaultValue = false)]
        public String Name { get; set; }

        [DataMember(Name = "date", EmitDefaultValue = false)]
        public String Date { get; set; }
        
        #endregion

        #region CONSTRUCTORS

        public PeriodicityModel()
            : this(0, String.Empty, String.Empty) { }

        public PeriodicityModel(Int32 type, String name, String date)
        {
            this.Type = type;
            this.Name = name;
            this.Date = date;
        }

        #endregion

        #region METHODS

        public override String ToString()
        {
            StringBuilder _sb = new StringBuilder();

            _sb.AppendLine("class PeriodicityModel {");
            _sb.Append("  Type: ").Append(this.Type).Append("\n");
            _sb.Append("  Name: ").Append(this.Name).Append("\n");
            _sb.Append("  Date: ").Append(this.Date).Append("\n");
            _sb.AppendLine("}");

            return _sb.ToString();
        }

        #endregion
    }
}
