using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP01WPF.Transport
{
    /// <summary>
    /// Restaurant transport class definition
    /// </summary>
    public class Restaurant
    {
        private int _RES_ID;
        private string _PRX_PRIX;
        private string _RES_NOM;
        private string _RES_DESCRIPTION;
        private string _RES_CATEGORIEPRIX;
        private string _res_adr;
        private string _RES_CP;
        private string _RES_VILLE;
        private string _RES_PAYS;
        private Nullable<float> _RES_LATITUDE;
        private Nullable<float> _RES_LONGITUDE;
        private int _IND_INDICATIF;
        private string _RES_TEL;
        private string _RES_SITEWEB;
        private string _RES_MEL;

        public int RES_ID
        {
            get
            {
                return _RES_ID;
            }
            set
            {
                _RES_ID = value;
            }
        }
        public string PRX_PRIX
        {
            get
            {
                return _PRX_PRIX;
            }
            set
            {
                _PRX_PRIX = value;
            }
        }
        public string RES_NOM
        {
            get
            {
                return _RES_NOM;
            }
            set
            {
                _RES_NOM = value;
            }
        }
        public string RES_DESCRIPTION
        {
            get
            {
                return _RES_DESCRIPTION;
            }
            set
            {
                _RES_DESCRIPTION = value;
            }
        }
        public string RES_CATEGORIEPRIX
        {
            get
            {
                return _RES_CATEGORIEPRIX;
            }
            set
            {
                _RES_CATEGORIEPRIX = value;
            }
        }
        public string res_adr
        {
            get
            {
                return _res_adr;
            }
            set
            {
                _res_adr = value;
            }
        }
        public string RES_CP
        {
            get
            {
                return _RES_CP;
            }
            set
            {
                _RES_CP = value;
            }
        }
        public string RES_VILLE
        {
            get
            {
                return _RES_VILLE;
            }
            set
            {
                _RES_VILLE = value;
            }
        }
        public string RES_PAYS
        {
            get
            {
                return _RES_PAYS;
            }
            set
            {
                _RES_PAYS = value;
            }
        }
        public Nullable<float> RES_LATITUDE
        {
            get
            {
                return _RES_LATITUDE;
            }
            set
            {
                _RES_LATITUDE = value;
            }
        }
        public Nullable<float> RES_LONGITUDE
        {
            get
            {
                return _RES_LONGITUDE;
            }
            set
            {
                _RES_LONGITUDE = value;
            }
        }
        public int IND_INDICATIF
        {
            get
            {
                return _IND_INDICATIF;
            }
            set
            {
                _IND_INDICATIF = value;
            }
        }
        public string RES_TEL
        {
            get
            {
                return _RES_TEL;
            }
            set
            {
                _RES_TEL = value;
            }
        }
        public string RES_SITEWEB
        {
            get
            {
                return _RES_SITEWEB;
            }
            set
            {
                _RES_SITEWEB = value;
            }
        }
        public string RES_MEL
        {
            get
            {
                return _RES_MEL;
            }
            set
            {
                _RES_MEL = value;
            }
        }

        public Restaurant(){}

        public Restaurant(string __PRX_PRIX, string __RES_NOM, string __RES_DESCRIPTION, string __RES_CATEGORIEPRIX, string __res_adr, string __RES_CP, string __RES_VILLE, string __RES_PAYS, int __IND_INDICATIF, string __RES_TEL, string __RES_SITEWEB, string __RES_MEL)
        {
            _PRX_PRIX = __PRX_PRIX;
            _RES_NOM = __RES_NOM;
            _RES_DESCRIPTION = __RES_DESCRIPTION;
            _RES_CATEGORIEPRIX = __RES_CATEGORIEPRIX;
            _res_adr = __res_adr;
            _RES_CP = __RES_CP;
            _RES_VILLE = __RES_VILLE;
            _RES_PAYS = __RES_PAYS;
            _RES_LATITUDE = null;
            _RES_LONGITUDE = null;
            _IND_INDICATIF = __IND_INDICATIF;
            _RES_TEL = __RES_TEL;
            _RES_SITEWEB = __RES_SITEWEB;
            _RES_MEL = __RES_MEL;
        }
        public Restaurant(int __RES_ID, string __PRX_PRIX, string __RES_NOM, string __RES_DESCRIPTION, string __RES_CATEGORIEPRIX, string __res_adr, string __RES_CP, string __RES_VILLE, string __RES_PAYS, int __IND_INDICATIF, string __RES_TEL, string __RES_SITEWEB, string __RES_MEL)
        {
            _RES_ID = __RES_ID;
            _PRX_PRIX = __PRX_PRIX;
            _RES_NOM = __RES_NOM;
            _RES_DESCRIPTION = __RES_DESCRIPTION;
            _RES_CATEGORIEPRIX = __RES_CATEGORIEPRIX;
            _res_adr = __res_adr;
            _RES_CP = __RES_CP;
            _RES_VILLE = __RES_VILLE;
            _RES_PAYS = __RES_PAYS;
            _RES_LATITUDE = null;
            _RES_LONGITUDE = null;
            _IND_INDICATIF = __IND_INDICATIF;
            _RES_TEL = __RES_TEL;
            _RES_SITEWEB = __RES_SITEWEB;
            _RES_MEL = __RES_MEL;
        }
    }
}
