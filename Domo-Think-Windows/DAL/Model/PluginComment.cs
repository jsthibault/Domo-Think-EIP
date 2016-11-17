using System;
using System.Runtime.Serialization;

namespace DAL.Model
{
    [DataContract]
    public class PluginComment
    {
        [DataMember(Name = "idComment", EmitDefaultValue = false)]
        public int Id { get; set; }

        [DataMember(Name = "author", EmitDefaultValue = false)]
        public string Author { get; set; }

        [DataMember(Name = "comment", EmitDefaultValue = false)]
        public string Comment { get; set; }

        [DataMember(Name = "rate", EmitDefaultValue = false)]
        public float Rate { get; set; }

        [DataMember(Name = "date", EmitDefaultValue = false)]
        public string Date { get; set; }

        [DataMember(Name = "storeplugins_idPlugin", EmitDefaultValue = false)]
        public int PluginId { get; set; }

        [DataMember(Name = "keyLoginHash", EmitDefaultValue = false)]
        public string KeyLoginHash { get; set; }
    }
}
