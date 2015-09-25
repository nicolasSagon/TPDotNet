using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace TP03.Models
{
    public class DataAccess
    {
        private SqlConnection Connection {get; set;}

        /// <summary>
        /// Connexion à la base de données
        /// </summary>
        /// <returns> Retourne un booléen indiquant si la connexion est ouverte ou fermée</returns>
        private Boolean OpenConnection()
        {
            try
            {
                this.Connection = new SqlConnection();
                this.Connection.ConnectionString = "data source=sqletu.cpe.fr;initial catalog=binome52;user id=binome52;password=binome52;";
                this.Connection.Open();
                return this.Connection.State.Equals(System.Data.ConnectionState.Open);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Déconnexion de la base de données
        /// </summary>
        private void CloseConnection()
        {
            if (this.Connection.State.Equals(System.Data.ConnectionState.Open))
            {
                this.Connection.Close();
            }
        }

        /// <summary>
        /// Accès à des données en lecture
        /// </summary>
        /// <param name="getQuery">Requête SELECT de sélection de données</param>
        /// <returns>Retourne un DataTable contenant les lignes renvoyées par le SELECT</returns>
        public DataTable GetData(String getQuery)
        {
            try
            {
                if (this.OpenConnection())
                {
                    SqlCommand command = new SqlCommand(getQuery, this.Connection);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = command;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    this.CloseConnection();
                    return dt;
                }
                else
                    throw new Exception("Erreur open connection.");
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Permet d'insérer, supprimer ou modifier des données
        /// </summary>
        /// <param name="setQuery">Requête SQL permettant d'insérer (INSERT), supprimer (DELETE) ou modifier des données (UPDATE).</param>
        /// <exception cref="System.Exception">Déclenchée si l'écriture/modification/suppression en base échoue.</exception> 
        /// <returns>Retourne un booléen indiquant si des lignes ont été ajoutées/supprimées/modifiées.</returns>
        public Boolean SetData(String setQuery)
        {
            Boolean ret = false;
            try
            {
                if (this.OpenConnection())
                {
                    int modifiedLines;
                    SqlCommand command = new SqlCommand(setQuery, this.Connection);
                    modifiedLines = command.ExecuteNonQuery();
                    if (modifiedLines > 0)
                    {
                        ret = true;
                    }
                    this.CloseConnection();
                    return ret;
                }
                else
                    throw new Exception("Erreur open connection");
            }
            catch
            {
                throw;
            }
        }
        
    }
}
