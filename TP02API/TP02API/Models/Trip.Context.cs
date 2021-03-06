﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class binome51Entities1 : DbContext
    {
        public binome51Entities1()
            : base("name=binome51Entities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<vAbonnes> vAbonnes { get; set; }
        public DbSet<vAvis> vAvis { get; set; }
        public DbSet<vRestaurants> vRestaurants { get; set; }
    
        public virtual ObjectResult<Nullable<decimal>> SPAbonne_Insert(string aBO_PSEUDO, string aBO_MOTPASSE, string aBO_MEL, string aBO_NOM, string aBO_PRENOM, string aBO_ADR, string aBO_CP, string aBO_VILLE, string aBO_PAYS, Nullable<float> aBO_LATITUDE, Nullable<float> aBO_LONGITUDE, Nullable<int> iND_INDICATIF, string aBO_TEL, string aBO_AEROPORT)
        {
            var aBO_PSEUDOParameter = aBO_PSEUDO != null ?
                new ObjectParameter("ABO_PSEUDO", aBO_PSEUDO) :
                new ObjectParameter("ABO_PSEUDO", typeof(string));
    
            var aBO_MOTPASSEParameter = aBO_MOTPASSE != null ?
                new ObjectParameter("ABO_MOTPASSE", aBO_MOTPASSE) :
                new ObjectParameter("ABO_MOTPASSE", typeof(string));
    
            var aBO_MELParameter = aBO_MEL != null ?
                new ObjectParameter("ABO_MEL", aBO_MEL) :
                new ObjectParameter("ABO_MEL", typeof(string));
    
            var aBO_NOMParameter = aBO_NOM != null ?
                new ObjectParameter("ABO_NOM", aBO_NOM) :
                new ObjectParameter("ABO_NOM", typeof(string));
    
            var aBO_PRENOMParameter = aBO_PRENOM != null ?
                new ObjectParameter("ABO_PRENOM", aBO_PRENOM) :
                new ObjectParameter("ABO_PRENOM", typeof(string));
    
            var aBO_ADRParameter = aBO_ADR != null ?
                new ObjectParameter("ABO_ADR", aBO_ADR) :
                new ObjectParameter("ABO_ADR", typeof(string));
    
            var aBO_CPParameter = aBO_CP != null ?
                new ObjectParameter("ABO_CP", aBO_CP) :
                new ObjectParameter("ABO_CP", typeof(string));
    
            var aBO_VILLEParameter = aBO_VILLE != null ?
                new ObjectParameter("ABO_VILLE", aBO_VILLE) :
                new ObjectParameter("ABO_VILLE", typeof(string));
    
            var aBO_PAYSParameter = aBO_PAYS != null ?
                new ObjectParameter("ABO_PAYS", aBO_PAYS) :
                new ObjectParameter("ABO_PAYS", typeof(string));
    
            var aBO_LATITUDEParameter = aBO_LATITUDE.HasValue ?
                new ObjectParameter("ABO_LATITUDE", aBO_LATITUDE) :
                new ObjectParameter("ABO_LATITUDE", typeof(float));
    
            var aBO_LONGITUDEParameter = aBO_LONGITUDE.HasValue ?
                new ObjectParameter("ABO_LONGITUDE", aBO_LONGITUDE) :
                new ObjectParameter("ABO_LONGITUDE", typeof(float));
    
            var iND_INDICATIFParameter = iND_INDICATIF.HasValue ?
                new ObjectParameter("IND_INDICATIF", iND_INDICATIF) :
                new ObjectParameter("IND_INDICATIF", typeof(int));
    
            var aBO_TELParameter = aBO_TEL != null ?
                new ObjectParameter("ABO_TEL", aBO_TEL) :
                new ObjectParameter("ABO_TEL", typeof(string));
    
            var aBO_AEROPORTParameter = aBO_AEROPORT != null ?
                new ObjectParameter("ABO_AEROPORT", aBO_AEROPORT) :
                new ObjectParameter("ABO_AEROPORT", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<decimal>>("SPAbonne_Insert", aBO_PSEUDOParameter, aBO_MOTPASSEParameter, aBO_MELParameter, aBO_NOMParameter, aBO_PRENOMParameter, aBO_ADRParameter, aBO_CPParameter, aBO_VILLEParameter, aBO_PAYSParameter, aBO_LATITUDEParameter, aBO_LONGITUDEParameter, iND_INDICATIFParameter, aBO_TELParameter, aBO_AEROPORTParameter);
        }
    
        public virtual int SPAbonne_Update(Nullable<int> aBO_ID, string aBO_PSEUDO, string aBO_MOTPASSE, string aBO_MEL, string aBO_NOM, string aBO_PRENOM, string aBO_ADR, string aBO_CP, string aBO_VILLE, string aBO_PAYS, Nullable<float> aBO_LATITUDE, Nullable<float> aBO_LONGITUDE, Nullable<int> iND_INDICATIF, string aBO_TEL, string aBO_AEROPORT)
        {
            var aBO_IDParameter = aBO_ID.HasValue ?
                new ObjectParameter("ABO_ID", aBO_ID) :
                new ObjectParameter("ABO_ID", typeof(int));
    
            var aBO_PSEUDOParameter = aBO_PSEUDO != null ?
                new ObjectParameter("ABO_PSEUDO", aBO_PSEUDO) :
                new ObjectParameter("ABO_PSEUDO", typeof(string));
    
            var aBO_MOTPASSEParameter = aBO_MOTPASSE != null ?
                new ObjectParameter("ABO_MOTPASSE", aBO_MOTPASSE) :
                new ObjectParameter("ABO_MOTPASSE", typeof(string));
    
            var aBO_MELParameter = aBO_MEL != null ?
                new ObjectParameter("ABO_MEL", aBO_MEL) :
                new ObjectParameter("ABO_MEL", typeof(string));
    
            var aBO_NOMParameter = aBO_NOM != null ?
                new ObjectParameter("ABO_NOM", aBO_NOM) :
                new ObjectParameter("ABO_NOM", typeof(string));
    
            var aBO_PRENOMParameter = aBO_PRENOM != null ?
                new ObjectParameter("ABO_PRENOM", aBO_PRENOM) :
                new ObjectParameter("ABO_PRENOM", typeof(string));
    
            var aBO_ADRParameter = aBO_ADR != null ?
                new ObjectParameter("ABO_ADR", aBO_ADR) :
                new ObjectParameter("ABO_ADR", typeof(string));
    
            var aBO_CPParameter = aBO_CP != null ?
                new ObjectParameter("ABO_CP", aBO_CP) :
                new ObjectParameter("ABO_CP", typeof(string));
    
            var aBO_VILLEParameter = aBO_VILLE != null ?
                new ObjectParameter("ABO_VILLE", aBO_VILLE) :
                new ObjectParameter("ABO_VILLE", typeof(string));
    
            var aBO_PAYSParameter = aBO_PAYS != null ?
                new ObjectParameter("ABO_PAYS", aBO_PAYS) :
                new ObjectParameter("ABO_PAYS", typeof(string));
    
            var aBO_LATITUDEParameter = aBO_LATITUDE.HasValue ?
                new ObjectParameter("ABO_LATITUDE", aBO_LATITUDE) :
                new ObjectParameter("ABO_LATITUDE", typeof(float));
    
            var aBO_LONGITUDEParameter = aBO_LONGITUDE.HasValue ?
                new ObjectParameter("ABO_LONGITUDE", aBO_LONGITUDE) :
                new ObjectParameter("ABO_LONGITUDE", typeof(float));
    
            var iND_INDICATIFParameter = iND_INDICATIF.HasValue ?
                new ObjectParameter("IND_INDICATIF", iND_INDICATIF) :
                new ObjectParameter("IND_INDICATIF", typeof(int));
    
            var aBO_TELParameter = aBO_TEL != null ?
                new ObjectParameter("ABO_TEL", aBO_TEL) :
                new ObjectParameter("ABO_TEL", typeof(string));
    
            var aBO_AEROPORTParameter = aBO_AEROPORT != null ?
                new ObjectParameter("ABO_AEROPORT", aBO_AEROPORT) :
                new ObjectParameter("ABO_AEROPORT", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SPAbonne_Update", aBO_IDParameter, aBO_PSEUDOParameter, aBO_MOTPASSEParameter, aBO_MELParameter, aBO_NOMParameter, aBO_PRENOMParameter, aBO_ADRParameter, aBO_CPParameter, aBO_VILLEParameter, aBO_PAYSParameter, aBO_LATITUDEParameter, aBO_LONGITUDEParameter, iND_INDICATIFParameter, aBO_TELParameter, aBO_AEROPORTParameter);
        }
    }
}
