//------------------------------------------------------------------------------
// <auto-generated>
//    Ce code a été généré à partir d'un modèle.
//
//    Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//    Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TP02API.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class vRestaurants
    {
        public vRestaurants()
        {
            this.vAvis = new HashSet<vAvis>();
        }
    
        public int id { get; set; }
        public string prix { get; set; }
        public string nom { get; set; }
        public string description { get; set; }
        public string categorieprix { get; set; }
        public string adresse { get; set; }
        public string cp { get; set; }
        public string ville { get; set; }
        public string pays { get; set; }
        public Nullable<float> latitude { get; set; }
        public Nullable<float> longitude { get; set; }
        public int indicatif { get; set; }
        public string tel { get; set; }
        public string siteweb { get; set; }
        public string mail { get; set; }
    
        private ICollection<vAvis> vAvis { get; set; }
    }
}