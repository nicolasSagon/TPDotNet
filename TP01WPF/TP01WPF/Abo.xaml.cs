using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using TP01WPF.Business.Assemblers.Base;
using TP01WPF.Business.IOServices;
using TP01WPF.Transport;

namespace TP01WPF
{
    /// <summary>
    /// Logique d'interaction pour Abo.xaml
    /// </summary>
    public partial class Abo : Window
    {

        private DataTable _dt = null;
        private int? _currentModifId = null;
        public Abo()
        {
            InitializeComponent();
            LoadDataGridAbo();

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            LoadDataGridAbo();
        }

        private void LoadDataGridAbo()
        {
            using (HttpWebResponse response = TP02RestApiWebCall.CallGetAbonneeSynchronous())
            {

                String result = String.Empty;
                Stream receiveStream = response.GetResponseStream();

                // Pipes the stream to a higher level stream reader with the required encoding format. 
                using (StreamReader readStream = new StreamReader(receiveStream, Encoding.UTF8))
                {
                    result = readStream.ReadToEnd();
                }

                this._dt = JsonConvert.DeserializeObject<DataTable>(result, new DataTableConverter());
                AbonnesGrid.DataContext = this._dt.DefaultView;
                ModifComboBoxAbonnes.DataContext = this._dt.DefaultView;
            }
        }

        /// <summary>
        /// Afficher abonné à modifier
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(ModifComboBoxAbonnes.Text))
            {
                this._currentModifId = Convert.ToInt32(ModifComboBoxAbonnes.Text);
                ModifComboBoxAbonnes.IsEnabled = false;
                List<Abonne> l = new AboAssembler().ConvertTo(this._dt.AsEnumerable().ToList());
                Abonne current = l.Where(o => o.id == this._currentModifId).FirstOrDefault();
                if (current != null)
                {
                    ModifNom.Text = current.nom;
                    ModifPseudo.Text = current.pseudo;
                    ModifMotDePasse.Text = current.motpasse;
                    ModifPrenom.Text = current.prenom;
                    ModifAdresse1.Text = current.adresse;
                    ModifAdresse2.Text = current.cp;
                    ModifAdresse3.Text = current.ville;
                    ModifAdresse4.Text = current.pays;
                    ModifLatitude.Text = current.latitude.ToString();
                    ModifLongitude.Text = current.longitude.ToString();
                    ModifTel1.Text = current.indicatif.ToString();
                    ModifTel2.Text = current.tel;
                    ModifMail.Text = current.mel;
                    ModifAeroport.Text = current.aeroport;
                }
            }
        }

        /// <summary>
        /// Enregistrer les modifications
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            Abonne abo = new Abonne();
            abo.pseudo = ModifPseudo.Text;
            abo.motpasse = ModifMotDePasse.Text;
            abo.mel = ModifMail.Text;
            abo.nom = ModifNom.Text;
            abo.prenom = ModifPrenom.Text;
            abo.adresse = ModifAdresse1.Text;
            abo.cp = ModifAdresse2.Text;
            abo.ville = ModifAdresse3.Text;
            abo.pays = ModifAdresse4.Text;
            abo.latitude = !String.IsNullOrEmpty(ModifLatitude.Text) ? Convert.ToDouble(ModifLatitude.Text) : (double?)null;
            abo.longitude = !String.IsNullOrEmpty(ModifLongitude.Text) ? Convert.ToDouble(ModifLongitude.Text) : (double?)null;
            abo.indicatif = Convert.ToInt32(ModifTel1.Text);
            abo.tel = ModifTel2.Text;
            abo.aeroport = ModifAeroport.Text;


            if (this._currentModifId.HasValue)
            {
                abo.id = this._currentModifId.Value;
                string aboJson = JsonConvert.SerializeObject(abo);
                TP02RestApiWebCall.CallPutAbonneSynchronous(this._currentModifId.Value, aboJson).Dispose();
            }
            else
            {
                string aboJson = JsonConvert.SerializeObject(abo);
                TP02RestApiWebCall.CallPostAbonneSynchronous(aboJson).Dispose();
            }
            ClearModifTab();
        }

        /// <summary>
        /// Annuler modifications
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            ClearModifTab();
        }

        private void ClearModifTab()
        {
            this._currentModifId = null;
            ModifComboBoxAbonnes.IsEnabled = true;
            ModifComboBoxAbonnes.Text = String.Empty;
            ModifNom.Text = String.Empty;
            ModifPseudo.Text = String.Empty;
            ModifMotDePasse.Text = String.Empty;
            ModifPrenom.Text = String.Empty;
            ModifAdresse1.Text = String.Empty;
            ModifAdresse2.Text = String.Empty;
            ModifAdresse3.Text = String.Empty;
            ModifAdresse4.Text = String.Empty;
            ModifLatitude.Text = String.Empty;
            ModifLongitude.Text = String.Empty;
            ModifTel1.Text = String.Empty;
            ModifTel2.Text = String.Empty;
            ModifMail.Text = String.Empty;
            ModifAeroport.Text = String.Empty;
        }
    }
}
