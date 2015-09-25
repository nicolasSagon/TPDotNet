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
    public class AbonnesController : ApiController
    {
        private binome51Entities1 db = new binome51Entities1();

        // GET api/Abonnes
        public IEnumerable<vAbonnes> GetvAbonnes()
        {
            return db.vAbonnes.AsEnumerable();
        }

        // GET api/Abonnes/5
        public vAbonnes GetvAbonnes(int id)
        {
            vAbonnes vabonnes = db.vAbonnes.Find(id);
            if (vabonnes == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return vabonnes;
        }

        // PUT api/Abonnes/5
        public HttpResponseMessage PutvAbonnes(int id, vAbonnes vabonnes)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            if (id != vabonnes.id)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            db.Entry(vabonnes).State = EntityState.Modified;

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

        // POST api/Abonnes
        public HttpResponseMessage PostvAbonnes(vAbonnes vabonnes)
        {
            if (ModelState.IsValid)
            {
                db.vAbonnes.Add(vabonnes);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, vabonnes);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = vabonnes.id }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        // DELETE api/Abonnes/5
        /*public HttpResponseMessage DeletevAbonnes(int id)
        {
            vAbonnes vabonnes = db.vAbonnes.Find(id);
            if (vabonnes == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.vAbonnes.Remove(vabonnes);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK, vabonnes);
        }*/

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}