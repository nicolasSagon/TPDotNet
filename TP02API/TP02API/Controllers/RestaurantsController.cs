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
using TP02API.Models;

namespace TP02API.Controllers
{
    public class RestaurantsController : ApiController
    {
        private binome51Entities1 db = new binome51Entities1();

        // GET api/Restaurants
        public IEnumerable<vRestaurants> GetvRestaurants()
        {
            return db.vRestaurants.AsEnumerable();
        }

        // GET api/Restaurants/5
        public vRestaurants GetvRestaurants(int id)
        {
            vRestaurants vrestaurants = db.vRestaurants.Find(id);
            if (vrestaurants == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return vrestaurants;
        }

        // PUT api/Restaurants/5
        public HttpResponseMessage PutvRestaurants(int id, vRestaurants vrestaurants)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            if (id != vrestaurants.id)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            db.Entry(vrestaurants).State = EntityState.Modified;

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

        // POST api/Restaurants
        public HttpResponseMessage PostvRestaurants(vRestaurants vrestaurants)
        {
            if (ModelState.IsValid)
            {
                db.vRestaurants.Add(vrestaurants);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, vrestaurants);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = vrestaurants.id }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        // DELETE api/Restaurants/5
        public HttpResponseMessage DeletevRestaurants(int id)
        {
            vRestaurants vrestaurants = db.vRestaurants.Find(id);
            if (vrestaurants == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.vRestaurants.Remove(vrestaurants);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK, vrestaurants);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}