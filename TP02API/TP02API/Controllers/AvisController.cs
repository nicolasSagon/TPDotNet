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
    public class AvisController : ApiController
    {
        private binome51Entities1 db = new binome51Entities1();

        // GET api/Avis
        public IEnumerable<vAvis> GetvAvis()
        {
            var vavis = db.vAvis.Include(v => v.vAbonnes).Include(v => v.vRestaurants);
            return vavis.AsEnumerable();
        }

        // GET api/Avis/5
        public vAvis GetvAvis(int id)
        {
            vAvis vavis = db.vAvis.Find(id);
            if (vavis == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return vavis;
        }

        // PUT api/Avis/5
        public HttpResponseMessage PutvAvis(int id, vAvis vavis)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            if (id != vavis.id)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            db.Entry(vavis).State = EntityState.Modified;

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

        // POST api/Avis
        public HttpResponseMessage PostvAvis(vAvis vavis)
        {
            if (ModelState.IsValid)
            {
                db.vAvis.Add(vavis);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, vavis);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = vavis.id }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        // DELETE api/Avis/5
        public HttpResponseMessage DeletevAvis(int id)
        {
            vAvis vavis = db.vAvis.Find(id);
            if (vavis == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.vAvis.Remove(vavis);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK, vavis);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}