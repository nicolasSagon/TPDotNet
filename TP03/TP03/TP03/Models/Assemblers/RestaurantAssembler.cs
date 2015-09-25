using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace TP03.Models.Assemblers.Bases
{
    public class RestaurantAssembler : BaseAssembler<Restaurant>
    {
        public override Restaurant ConvertTo(DataRow source)
        {
            if (source == null)
                return null;
            Restaurant resto = new Restaurant();
            resto.Id = Convert.ToInt32(source["RES_ID"].ToString());
            resto.Prix = source["PRX_Prix"].ToString();
            resto.Nom = source["RES_Nom"].ToString();
            resto.Description = source["RES_Description"].ToString();
            resto.CategoriePrix = source["RES_CategoriePrix"].ToString();
            resto.Adresse1 = source["RES_AdrLigne1"].ToString();
            resto.Adresse2 = source["RES_AdrLigne2"].ToString();
            resto.CP = source["RES_CP"].ToString();
            resto.Ville = source["RES_Ville"].ToString();
            resto.Etat = source["RES_Etat"].ToString();
            resto.PaysId = Convert.ToInt32(source["PAY_ID"].ToString());
            resto.Latitude = Convert.ToDouble(source["RES_Latitude"].ToString());
            resto.Longitude = Convert.ToDouble(source["RES_Longitude"].ToString());
            resto.Indicatif = Convert.ToInt32(source["IND_Indicatif"].ToString());
            resto.Tel = source["RES_TEL"].ToString();
            resto.Web = source["RES_SiteWeb"].ToString();
            resto.Mel = source["RES_Mel"].ToString();
            return resto;
        }
    }
}