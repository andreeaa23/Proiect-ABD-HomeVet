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
    
    public partial class CabineteSectii
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CabineteSectii()
        {
            this.Medici = new HashSet<Medici>();
        }
    
        public int idCabineteSectii { get; set; }
        public Nullable<int> idCabinet { get; set; }
        public Nullable<int> idSectie { get; set; }
    
        public virtual Cabinete Cabinete { get; set; }
        public virtual Sectii Sectii { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Medici> Medici { get; set; }
    }
}
