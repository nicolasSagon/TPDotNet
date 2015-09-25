using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP01WPF.Transport
{
    public class Abonne
    {
        public int id { get; set; }
        public string pseudo { get; set; }
        public string motpasse { get; set; }
        public string mel { get; set; }
        public string nom { get; set; }
        public string prenom { get; set; }
        public string adresse { get; set; }
        public string cp { get; set; }
        public string ville { get; set; }
        public string pays { get; set; }
        public double? latitude { get; set; }
        public double? longitude { get; set; }
        public int indicatif { get; set; }
        public string tel { get; set; }
        public string aeroport { get; set; }
    }
}
