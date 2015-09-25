using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using TP03.Models.Assemblers.Bases;
using TP03.Models.Bases;

namespace TP03.Models
{
    public class RestaurantService : CRUD<Restaurant>
    {

        private DataAccess _da = new DataAccess();
        private RestaurantAssembler _restaurantAssembler = new RestaurantAssembler();

        #region SQL RESQUESTS
        private const string READ_ALL_SQL_REQUEST = "SELECT * FROM T_E_Restaurant_RES";
        private const string READ_ONE_SQL_REQUEST_TEMPLATE = "SELECT TOP 1 * FROM T_E_Restaurant_RES WHERE RES_ID = {0}";
        #endregion

        public int Create(Restaurant t)
        {
            throw new NotImplementedException();
        }

        public bool Update(Restaurant t)
        {
            throw new NotImplementedException();
        }

        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public List<Restaurant> ReadAll()
        {
            try
            {
                List<Restaurant> listeRestos = new List<Restaurant> { };
                DataTable dt = _da.GetData(READ_ALL_SQL_REQUEST);
                if (dt.Rows.Count == 0)
                    return null;
                return _restaurantAssembler.ConvertTo(dt.Rows);
            }
            catch
            {
                throw;
            }
        }

        public Restaurant ReadOne(int id)
        {
            try
            {
                if (id <= 0)
                    return null;
                DataTable dt = _da.GetData(String.Format(READ_ONE_SQL_REQUEST_TEMPLATE, id));
                if (dt.Rows.Count == 0)
                    return null;
                return _restaurantAssembler.ConvertTo(dt.Rows[0]);
            } 
            catch
            {
                throw;
            }
        }
    }
}