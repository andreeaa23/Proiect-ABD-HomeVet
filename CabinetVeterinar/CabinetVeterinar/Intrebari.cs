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
    
    public partial class Intrebari
    {
        public int idIntrebare { get; set; }
        public Nullable<int> idUtilizator { get; set; }
        public Nullable<int> idMedic { get; set; }
        public string MesajIntrebare { get; set; }
        public string StatusIntrebare { get; set; }
        public string MesajRaspuns { get; set; }
    
        public virtual Medici Medici { get; set; }
        public virtual Utilizatori Utilizatori { get; set; }
    }
}
