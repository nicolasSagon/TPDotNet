using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using TP03.Controllers;

namespace TP03.Tests.Controllers
{
    class RestaurantControllerTest
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

    }
}
