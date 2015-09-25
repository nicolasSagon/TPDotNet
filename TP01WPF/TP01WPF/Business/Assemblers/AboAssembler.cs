using System;
using System.Data;
using TP01WPF.Transport;

namespace TP01WPF.Business.Assemblers.Base
{
    public class AboAssembler : BaseAssembler<DataRow, Abonne>
    {
        public override Abonne ConvertTo(DataRow source)
        {
            if (source == null)
                return null;
            Abonne abo = new Abonne();
            abo.id = Convert.ToInt32(source.Field<long>("id"));
            abo.pseudo = source.Field<string>("pseudo");
            abo.motpasse = source.Field<string>("motpasse");
            abo.mel = source.Field<string>("mel");
            abo.nom = source.Field<string>("nom");
            abo.prenom = source.Field<string>("prenom");
            abo.adresse = source.Field<string>("adresse");
            abo.cp = source.Field<string>("cp");
            abo.ville = source.Field<string>("ville");
            abo.pays = source.Field<string>("pays");
            abo.latitude = source.Field<double?>("latitude");
            abo.longitude = source.Field<double?>("longitude");
            abo.indicatif = Convert.ToInt32(source.Field<long>("indicatif"));
            abo.tel = source.Field<string>("tel");
            abo.aeroport = source.Field<string>("aeroport");
            return abo;
        }
    }
}
