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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml;
using System.Xml.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using TP01WPF.Transport;
using TP01WPF.Business.Services;
using TP01WPF.Business.IOServices;
using TP01WPF.Properties;
using System.Threading;

namespace TP01WPF
{
    /// <summary>
    /// Logique d'interaction pour Resto.xaml
    /// </summary>
    public partial class Resto : Window
    {
        private string _currentModifRestaurantId { get; set; }

        public Resto()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Get All restaurants
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (Settings.Default.AsyncMode)
            {
                TP01RestApiWebCall.CallGetRestaurantAsynchronous(ComboBoxFormat.Text, new AsyncCallback(this.Button_Click_CallBack));
            }
            else
            {
                using (HttpWebResponse response = TP01RestApiWebCall.CallGetRestaurantSynchronous(ComboBoxFormat.Text))
                {
                    Stream receiveStream = response.GetResponseStream();
                    using (StreamReader readStream = new StreamReader(receiveStream, Encoding.UTF8))
                    {
                        TextBoxResult.Text = readStream.ReadToEnd();
                    }
                }
            }
        }

        /// <summary>
        /// Get All restaurants callback
        /// </summary>
        /// <param name="request"></param>
        private void Button_Click_CallBack(IAsyncResult result)
        {
            using (HttpWebResponse response = (result.AsyncState as HttpWebRequest).EndGetResponse(result) as HttpWebResponse)
            {
                Stream receiveStream = response.GetResponseStream();
                using (StreamReader readStream = new StreamReader(receiveStream, Encoding.UTF8))
                {
                    string readResult = readStream.ReadToEnd();
                    TextBoxResult.Dispatcher.BeginInvoke(new Action(() => { TextBoxResult.Text = readResult; }));
                }
            }
        }

        /// <summary>
        /// SET tabPanels
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(TextBoxResult.Text))
            {
                switch (ComboBoxFormat.SelectionBoxItem.ToString())
                {
                    case "Json":
                        DataTable dt = JsonConvert.DeserializeObject<DataTable>(TextBoxResult.Text, new DataTableConverter());
                        AllRestaurantGrid.DataContext = dt.DefaultView;
                        ComboBoxListeResto.DataContext = dt.DefaultView;
                        ComboBoxListeRestoModif.DataContext = dt.DefaultView;
                        ComboBoxListeRestoDel.DataContext = dt.DefaultView;
                        break;
                    case "XML":
                        StringReader theReader = new StringReader(TextBoxResult.Text);
                        DataSet theDataSet = new DataSet();
                        theDataSet.ReadXml(theReader);
                        AllRestaurantGrid.DataContext = theDataSet.Tables[0].DefaultView;
                        ComboBoxListeResto.DataContext = theDataSet.Tables[0].DefaultView;
                        ComboBoxListeRestoModif.DataContext = theDataSet.Tables[0].DefaultView;
                        ComboBoxListeRestoDel.DataContext = theDataSet.Tables[0].DefaultView;
                        break;
                }
            }
            else
            {
                DataTable dataTable = new DataTable("AllRestaurantTable");
                dataTable.Columns.Add("Nom", typeof(string));
                dataTable.Columns.Add("Description", typeof(string));
                AllRestaurantGrid.DataContext = dataTable.DefaultView;
                ComboBoxListeResto.DataContext = dataTable.DefaultView;
                ComboBoxListeRestoModif.DataContext = dataTable.DefaultView;
                ComboBoxListeRestoDel.DataContext = dataTable.DefaultView;
            }
        }

        /// <summary>
        /// Bouton Vider
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            TextBoxResult.Text = String.Empty;
        }

        /// <summary>
        /// Bouton Rechercher
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            if (Settings.Default.AsyncMode)
            {
                TP01RestApiWebCall.CallGetRestaurantByIdAsynchronous(ComboBoxListeResto.Text, new AsyncCallback(Button_Click_3_CallBack));
            }
            else
            {
                Restaurant resto = new RestaurantService().GetRestaurantById(ComboBoxListeResto.Text);
                TextBoxAdresse1.Text = resto.res_adr;
                TextBoxAdresse2.Text = resto.RES_CP;
                TextBoxAdresse3.Text = resto.RES_VILLE;
                TextBoxAdresse4.Text = resto.RES_PAYS;
                TextBoxCategoriePrix.Text = resto.RES_CATEGORIEPRIX;
                TextBoxDescription.Text = resto.RES_DESCRIPTION;
                TextBoxMail.Text = resto.RES_MEL;
                TextBoxNom.Text = resto.RES_NOM;
                TextBoxPrix.Text = resto.PRX_PRIX;
                TextBoxTel1.Text = resto.IND_INDICATIF.ToString();
                TextBoxTel2.Text = resto.RES_TEL;
                TextBoxWeb.Text = resto.RES_SITEWEB;
            }
        }

        /// <summary>
        /// Bouton Rechercher CallBack
        /// </summary>
        /// <param name="result"></param>
        private void Button_Click_3_CallBack(IAsyncResult result)
        {
            using (HttpWebResponse response = (result.AsyncState as HttpWebRequest).EndGetResponse(result) as HttpWebResponse)
            {
                // Get the stream associated with the response.
                Stream receiveStream = response.GetResponseStream();
                // Pipes the stream to a higher level stream reader with the required encoding format. 
                using (StreamReader readStream = new StreamReader(receiveStream, Encoding.UTF8))
                {
                    Restaurant resto = JsonConvert.DeserializeObject<Restaurant>(readStream.ReadToEnd());
                    TextBoxAdresse1.Dispatcher.BeginInvoke(new Action(() => { TextBoxAdresse1.Text = resto.res_adr; }));
                    TextBoxAdresse2.Dispatcher.BeginInvoke(new Action(() => { TextBoxAdresse2.Text = resto.RES_CP; }));
                    TextBoxAdresse3.Dispatcher.BeginInvoke(new Action(() => { TextBoxAdresse3.Text = resto.RES_VILLE; }));
                    TextBoxAdresse4.Dispatcher.BeginInvoke(new Action(() => { TextBoxAdresse4.Text = resto.RES_PAYS; }));
                    TextBoxCategoriePrix.Dispatcher.BeginInvoke(new Action(() => { TextBoxCategoriePrix.Text = resto.RES_CATEGORIEPRIX; }));
                    TextBoxDescription.Dispatcher.BeginInvoke(new Action(() => { TextBoxDescription.Text = resto.RES_DESCRIPTION; }));
                    TextBoxMail.Dispatcher.BeginInvoke(new Action(() => { TextBoxMail.Text = resto.RES_MEL; }));
                    TextBoxNom.Dispatcher.BeginInvoke(new Action(() => { TextBoxNom.Text = resto.RES_NOM; }));
                    TextBoxPrix.Dispatcher.BeginInvoke(new Action(() => { TextBoxPrix.Text = resto.PRX_PRIX; }));
                    TextBoxTel1.Dispatcher.BeginInvoke(new Action(() => { TextBoxTel1.Text = resto.IND_INDICATIF.ToString(); }));
                    TextBoxTel2.Dispatcher.BeginInvoke(new Action(() => { TextBoxTel2.Text = resto.RES_TEL; }));
                    TextBoxWeb.Dispatcher.BeginInvoke(new Action(() => { TextBoxWeb.Text = resto.RES_SITEWEB; }));
                }
            }
        }

        /// <summary>
        /// Create
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            
                Restaurant resto = new Restaurant(AddComboBoxPrix.Text, AddTextBoxNom.Text, AddTextBoxDescription.Text, AddTextBoxCategoriePrix.Text, AddTextBoxAdresse1.Text, AddTextBoxAdresse2.Text, AddTextBoxAdresse3.Text, AddTextBoxAdresse4.Text, Convert.ToInt32(AddTextBoxTel1.Text), AddTextBoxTel2.Text, AddTextBoxWeb.Text, AddTextBoxMail.Text);
                string restoJson = JsonConvert.SerializeObject(resto);
            if (Settings.Default.AsyncMode)
            {
                TP01RestApiWebCall.CallPostRestaurantAsynchronous(restoJson, new AsyncCallback(this.Button_Click_4_CallBack));
            }
            else
            {

                using (HttpWebResponse response = TP01RestApiWebCall.CallPostRestaurantSynchronous(restoJson))
                {
                    if (response.StatusCode == System.Net.HttpStatusCode.Created)
                    {
                        AddComboBoxPrix.Text = String.Empty;
                        AddTextBoxNom.Text = String.Empty;
                        AddTextBoxDescription.Text = String.Empty;
                        AddTextBoxCategoriePrix.Text = String.Empty;
                        AddTextBoxAdresse1.Text = String.Empty;
                        AddTextBoxAdresse2.Text = String.Empty;
                        AddTextBoxAdresse3.Text = String.Empty;
                        AddTextBoxAdresse4.Text = String.Empty;
                        AddTextBoxTel1.Text = String.Empty;
                        AddTextBoxTel2.Text = String.Empty;
                        AddTextBoxWeb.Text = String.Empty;
                        AddTextBoxMail.Text = String.Empty;
                    }
                }
            }
        }

        /// <summary>
        /// Create Callback
        /// </summary>
        /// <param name="result"></param>
        private void Button_Click_4_CallBack(IAsyncResult result)
        {
            using (HttpWebResponse response = (result.AsyncState as HttpWebRequest).EndGetResponse(result) as HttpWebResponse)
            {
                if (response.StatusCode == System.Net.HttpStatusCode.Created)
                {
                    AddComboBoxPrix.Dispatcher.BeginInvoke(new Action(() => { AddComboBoxPrix.Text = String.Empty; }));
                    AddTextBoxNom.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxNom.Text = String.Empty; }));
                    AddTextBoxDescription.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxDescription.Text = String.Empty; }));
                    AddTextBoxCategoriePrix.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxCategoriePrix.Text = String.Empty; }));
                    AddTextBoxAdresse1.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxAdresse1.Text = String.Empty; }));
                    AddTextBoxAdresse2.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxAdresse2.Text = String.Empty; }));
                    AddTextBoxAdresse3.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxAdresse3.Text = String.Empty; }));
                    AddTextBoxAdresse4.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxAdresse4.Text = String.Empty; }));
                    AddTextBoxTel1.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxTel1.Text = String.Empty; }));
                    AddTextBoxTel2.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxTel2.Text = String.Empty; }));
                    AddTextBoxWeb.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxWeb.Text = String.Empty; }));
                    AddTextBoxMail.Dispatcher.BeginInvoke(new Action(() => { AddTextBoxMail.Text = String.Empty; }));
                }
            }
        }

        /// <summary>
        /// Rechercher avant modif
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            if (Settings.Default.AsyncMode)
            {
                if (!String.IsNullOrEmpty(ComboBoxListeRestoModif.Text))
                {
                    TP01RestApiWebCall.CallGetRestaurantByIdAsynchronous(ComboBoxListeRestoModif.Text, new AsyncCallback(this.Button_Click_5_CallBack));
                    _currentModifRestaurantId = ComboBoxListeRestoModif.Text;
                    ModifButton.IsEnabled = true;
                }
            }
            else
            {
                Restaurant resto = new RestaurantService().GetRestaurantById(ComboBoxListeRestoModif.Text);
                ModifTextBoxAdresse1.Text = resto.res_adr;
                ModifTextBoxAdresse2.Text = resto.RES_CP;
                ModifTextBoxAdresse3.Text = resto.RES_VILLE;
                ModifTextBoxAdresse4.Text = resto.RES_PAYS;
                ModifTextBoxCategoriePrix.Text = resto.RES_CATEGORIEPRIX;
                ModifTextBoxDescription.Text = resto.RES_DESCRIPTION;
                ModifTextBoxMail.Text = resto.RES_MEL;
                ModifTextBoxNom.Text = resto.RES_NOM;
                ModifComboBoxPrix.Text = resto.PRX_PRIX;
                ModifTextBoxTel1.Text = resto.IND_INDICATIF.ToString();
                ModifTextBoxTel2.Text = resto.RES_TEL;
                ModifTextBoxWeb.Text = resto.RES_SITEWEB;
                if (!String.IsNullOrEmpty(ComboBoxListeRestoModif.Text))
                {
                    _currentModifRestaurantId = ComboBoxListeRestoModif.Text;
                    ModifButton.IsEnabled = true;
                }
            }
        }

        /// <summary>
        /// Rechercher avant modif callback
        /// </summary>
        /// <param name="result"></param>
        private void Button_Click_5_CallBack(IAsyncResult result)
        {
            using (HttpWebResponse response = (result.AsyncState as HttpWebRequest).EndGetResponse(result) as HttpWebResponse)
            {
                Restaurant resto = new Restaurant();
                Stream receiveStream = response.GetResponseStream();
                using (StreamReader readStream = new StreamReader(receiveStream, Encoding.UTF8))
                {
                     resto = JsonConvert.DeserializeObject<Restaurant>(readStream.ReadToEnd());
                }
                ModifTextBoxAdresse1.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxAdresse1.Text = resto.res_adr; }));
                ModifTextBoxAdresse2.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxAdresse2.Text = resto.RES_CP; }));
                ModifTextBoxAdresse3.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxAdresse3.Text = resto.RES_VILLE; }));
                ModifTextBoxAdresse4.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxAdresse4.Text = resto.RES_PAYS; }));
                ModifTextBoxCategoriePrix.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxCategoriePrix.Text = resto.RES_CATEGORIEPRIX; }));
                ModifTextBoxDescription.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxDescription.Text = resto.RES_DESCRIPTION; }));
                ModifTextBoxMail.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxMail.Text = resto.RES_MEL; }));
                ModifTextBoxNom.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxNom.Text = resto.RES_NOM; }));
                ModifComboBoxPrix.Dispatcher.BeginInvoke(new Action(() => { ModifComboBoxPrix.Text = resto.PRX_PRIX; }));
                ModifTextBoxTel1.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxTel1.Text = resto.IND_INDICATIF.ToString(); ; }));
                ModifTextBoxTel2.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxTel2.Text = resto.RES_TEL; }));
                ModifTextBoxWeb.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxWeb.Text = resto.RES_SITEWEB; }));
            }
        }

        /// <summary>
        /// Modifier
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(_currentModifRestaurantId))
            {
                Restaurant resto = new Restaurant(Convert.ToInt32(ComboBoxListeRestoModif.Text), ModifComboBoxPrix.Text, ModifTextBoxNom.Text, ModifTextBoxDescription.Text, ModifTextBoxCategoriePrix.Text, ModifTextBoxAdresse1.Text, ModifTextBoxAdresse2.Text, ModifTextBoxAdresse3.Text, ModifTextBoxAdresse4.Text, Convert.ToInt32(ModifTextBoxTel1.Text), ModifTextBoxTel2.Text, ModifTextBoxWeb.Text, ModifTextBoxMail.Text);
                string restoJson = JsonConvert.SerializeObject(resto);

                if (Settings.Default.AsyncMode)
                {
                    TP01RestApiWebCall.CallPutRestaurantAsynchronous(_currentModifRestaurantId, restoJson, new AsyncCallback(this.Button_Click_6_CallBack));
                }
                else
                {
                    using (HttpWebResponse response = TP01RestApiWebCall.CallPutRestaurantSynchronous(_currentModifRestaurantId, restoJson))
                    {
                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                        {
                            ModifButton.IsEnabled = false;
                            ComboBoxListeRestoModif.Text = String.Empty;
                            ModifComboBoxPrix.Text = String.Empty;
                            ModifTextBoxNom.Text = String.Empty;
                            ModifTextBoxDescription.Text = String.Empty;
                            ModifTextBoxCategoriePrix.Text = String.Empty;
                            ModifTextBoxAdresse1.Text = String.Empty;
                            ModifTextBoxAdresse2.Text = String.Empty;
                            ModifTextBoxAdresse3.Text = String.Empty;
                            ModifTextBoxAdresse4.Text = String.Empty;
                            ModifTextBoxTel1.Text = String.Empty;
                            ModifTextBoxTel2.Text = String.Empty;
                            ModifTextBoxWeb.Text = String.Empty;
                            ModifTextBoxMail.Text = String.Empty;
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Modifer CallBack
        /// </summary>
        /// <param name="result"></param>
        private void Button_Click_6_CallBack(IAsyncResult result)
        {
            using (HttpWebResponse response = (result.AsyncState as HttpWebRequest).EndGetResponse(result) as HttpWebResponse)
            {
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    ModifButton.Dispatcher.BeginInvoke(new Action(() => { ModifButton.IsEnabled = false; }));
                    ComboBoxListeRestoModif.Dispatcher.BeginInvoke(new Action(() => { ComboBoxListeRestoModif.Text = String.Empty; }));
                    ModifComboBoxPrix.Dispatcher.BeginInvoke(new Action(() => { ModifComboBoxPrix.Text = String.Empty; }));
                    ModifTextBoxNom.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxNom.Text = String.Empty; }));
                    ModifTextBoxDescription.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxDescription.Text = String.Empty; }));
                    ModifTextBoxCategoriePrix.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxCategoriePrix.Text = String.Empty; }));
                    ModifTextBoxAdresse1.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxAdresse1.Text = String.Empty; }));
                    ModifTextBoxAdresse2.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxAdresse2.Text = String.Empty; }));
                    ModifTextBoxAdresse3.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxAdresse3.Text = String.Empty; }));
                    ModifTextBoxAdresse4.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxAdresse4.Text = String.Empty; }));
                    ModifTextBoxTel1.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxTel1.Text = String.Empty; }));
                    ModifTextBoxTel2.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxTel2.Text = String.Empty; }));
                    ModifTextBoxWeb.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxWeb.Text = String.Empty; }));
                    ModifTextBoxMail.Dispatcher.BeginInvoke(new Action(() => { ModifTextBoxMail.Text = String.Empty; }));
                }
            }
        }

        /// <summary>
        /// Supprimer
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_7(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrEmpty(ComboBoxListeRestoDel.Text))
            {
                if (Settings.Default.AsyncMode)
                {
                    TP01RestApiWebCall.CallDeleteRestaurantAsynchronous(ComboBoxListeRestoDel.Text, new AsyncCallback(this.Button_Click_7_CallBack));
                }
                else
                {
                    using (HttpWebResponse response = TP01RestApiWebCall.CallDeleteRestaurantSynchronous(ComboBoxListeRestoDel.Text))
                    {
                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                        {
                            ComboBoxListeRestoDel.Text = String.Empty;
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Supprimer callback
        /// </summary>
        /// <param name="result"></param>
        private void Button_Click_7_CallBack(IAsyncResult result)
        {
            using (HttpWebResponse response = (result.AsyncState as HttpWebRequest).EndGetResponse(result) as HttpWebResponse)
            {
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    ComboBoxListeRestoDel.Dispatcher.BeginInvoke(new Action(() => { ComboBoxListeRestoDel.Text = String.Empty; }));
                }
            }
        }

    }
}