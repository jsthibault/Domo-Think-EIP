using System.Runtime.Serialization;

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
        [DataMember(Name = "day", EmitDefaultValue = false)]
        public int Day { get; set; }

        [DataMember(Name = "hour", EmitDefaultValue = false)]
        public string Hour { get; set; }

        public PeriodicityModel()
        {
        }

        public PeriodicityModel(int day, string hour)
        {
            this.Day = day;
            this.Hour = hour;
        }
    }
}
