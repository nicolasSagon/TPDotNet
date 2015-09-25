using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TP03.Models;

namespace TP03.Controllers
{
    public class RestaurantsController : Controller
    {
        //
        // GET: /Restaurants/

        public ActionResult Index()
        {
            try
            {
                List<Restaurant> r = new RestaurantService().ReadAll();
                if (r == null || r.Count == 0)
                    return HttpNotFound("Il n'y a pas de restaurants correspondant à vos critères.");
                return View(r);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public ActionResult Selection(int? id)
        {
            try
            {
                if (!id.HasValue || id <= 0)
                    return RedirectToAction("Index");
                Restaurant r = new RestaurantService().ReadOne(id.Value);
                if (r == null)
                    return HttpNotFound("Restaurant inconnu.");
                return View(r);
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

    }
}
