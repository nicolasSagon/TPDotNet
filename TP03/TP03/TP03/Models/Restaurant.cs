using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TP03.Models
{
    public class Restaurant
    {
        public int Id { get; set; }
        public string Prix { get; set; }
        public string Nom { get; set; }
        public string Description { get; set; }

        [Display(Name="Catégorie de prix")]
        public string CategoriePrix { get; set; }

        [Display(Name="Adresse")]
        public string Adresse1 { get; set; }
        public string Adresse2 { get; set; }
        public string CP { get; set; }
        public string Ville { get; set; }
        public string Etat { get; set; }
        public int PaysId { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public int Indicatif { get; set; }

        [Display(Name = "Téléphone")]
        public string Tel { get; set; }

        [Display(Name = "Site web")]
        public string Web { get; set; }

        [Display(Name = "Mail")]
        public string Mel { get; set; }

        /// <summary>
        /// Constructor
        /// </summary>
        public Restaurant()
        {

        }


        
    }
}