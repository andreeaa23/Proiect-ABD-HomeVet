//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CabinetVeterinar
{
    using System;
    using System.Collections.Generic;
    
    public partial class Programari
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Programari()
        {
            this.ProbeColectate = new HashSet<ProbeColectate>();
        }
    
        public int idProgramare { get; set; }
        public Nullable<int> idPacient { get; set; }
        public Nullable<int> idMedic { get; set; }
        public Nullable<System.DateTime> DataProgramare { get; set; }
        public string Tip { get; set; }
        public string StatusProgramare { get; set; }
        public string Ora { get; set; }
    
        public virtual Medici Medici { get; set; }
        public virtual Pacienti Pacienti { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProbeColectate> ProbeColectate { get; set; }
    }
}
