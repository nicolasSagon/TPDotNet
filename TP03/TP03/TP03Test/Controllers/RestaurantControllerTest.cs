using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TP03.Controllers;
using TP03.Models;

namespace TP03.Tests.Controllers
{
    [TestClass]
    public class RestaurantControllerTest
    {

        [TestMethod]
        public void TestIdOkSelectionView()
        {
            //Arange
            RestaurantsController controller = new RestaurantsController();

            //Act
            ViewResult result = controller.Selection(1) as ViewResult;

            //Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void TestSelectionViewData()
        {
            //Arange
            RestaurantsController controller = new RestaurantsController();

            //Act
            ViewResult result = controller.Selection(1) as ViewResult;
            Restaurant resto = (Restaurant)result.ViewData.Model;


            //Assert
            Assert.AreEqual("Restaurant Le Clos des Sens", resto.Nom);
        }
        [TestMethod]
        public void TestIndexViewData()
        {
            RestaurantsController controller = new RestaurantsController();

            //Act
            ViewResult result = controller.Index() as ViewResult;
            Restaurant resto = ((List<Restaurant>)result.ViewData.Model).First();


            //Assert
            Assert.AreEqual("Restaurant Le Clos des Sens", resto.Nom);

        }

        [TestMethod]
        public void TestSelectionRedirect()
        {

            //Arange
            RestaurantsController controller = new RestaurantsController();

            //Act
            RedirectToRouteResult result = (RedirectToRouteResult)controller.Selection(null);

            //ASSERT
            Assert.AreEqual("Index", result.RouteValues["action"]);
        }

    }
}
