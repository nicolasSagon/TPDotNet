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
    
    public partial class vAvis
    {
        public int id { get; set; }
        public int idabonne { get; set; }
        public int idrestaurant { get; set; }
        public int idvisite { get; set; }
        public int idrepas { get; set; }
        public string prix { get; set; }
        public System.DateTime dateavis { get; set; }
        public string titre { get; set; }
        public string detail { get; set; }
        public decimal noteglobale { get; set; }
        public decimal notecuisine { get; set; }
        public decimal noteservice { get; set; }
        public decimal notequaliteprix { get; set; }
        public decimal noteambiance { get; set; }
    
        public virtual vAbonnes vAbonnes { get; set; }
        public virtual vRestaurants vRestaurants { get; set; }
    }
}
