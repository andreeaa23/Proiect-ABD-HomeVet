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
    
    public partial class Cabinete
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cabinete()
        {
            this.CabineteSectii = new HashSet<CabineteSectii>();
        }
    
        public int idCabinet { get; set; }
        public string Adresa { get; set; }
        public string Oras { get; set; }
        public string NrTelefon { get; set; }
        public string Program { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CabineteSectii> CabineteSectii { get; set; }
    }
}
