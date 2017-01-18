using System.Runtime.Serialization;

namespace DAL.Model
{
    [DataContract]
    public class BoxStatusModel
    {
        [DataMember(Name = "simulator")]
        public bool Simulator { get; set; }

        [DataMember(Name = "zwave")]
        public bool ZWave { get; set; }

        public BoxStatusModel()
        {
        }
    }
}
