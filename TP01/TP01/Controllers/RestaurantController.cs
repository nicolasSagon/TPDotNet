using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using TP01.Models;

namespace TP01.Controllers
{
    public class RestaurantController : ApiController
    {
        private binome51Entities db = new binome51Entities();

        // GET api/Restaurant
        public IEnumerable<T_E_RESTAURANT_RES> GetRestaurant()
        {
            return db.T_E_RESTAURANT_RES.AsEnumerable();
        }

        // GET api/Restaurant/5
        public T_E_RESTAURANT_RES GetRestaurant(int id)
        {
            T_E_RESTAURANT_RES t_e_restaurant_res = db.T_E_RESTAURANT_RES.Find(id);
            if (t_e_restaurant_res == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return t_e_restaurant_res;
        }

        // PUT api/Restaurant/5
        public HttpResponseMessage PutRestaurant(int id, T_E_RESTAURANT_RES t_e_restaurant_res)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            if (id != t_e_restaurant_res.RES_ID)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            db.Entry(t_e_restaurant_res).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK);
        }

        // POST api/Restaurant
        public HttpResponseMessage PostRestaurant(T_E_RESTAURANT_RES t_e_restaurant_res)
        {
            if (ModelState.IsValid)
            {
                db.T_E_RESTAURANT_RES.Add(t_e_restaurant_res);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, t_e_restaurant_res);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = t_e_restaurant_res.RES_ID }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        // DELETE api/Restaurant/5
        public HttpResponseMessage DeleteRestaurant(int id)
        {
            T_E_RESTAURANT_RES t_e_restaurant_res = db.T_E_RESTAURANT_RES.Find(id);
            if (t_e_restaurant_res == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.T_E_RESTAURANT_RES.Remove(t_e_restaurant_res);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK, t_e_restaurant_res);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}