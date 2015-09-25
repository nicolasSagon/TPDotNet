using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using TP01WPF.Business.IOServices;
using TP01WPF.Transport;

namespace TP01WPF.Business.Services
{
    public class RestaurantService
    {
        /// <summary>
        /// Gets a restaurant by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Restaurant GetRestaurantById(string id)
        {
            Restaurant returned = new Restaurant();
            if (!String.IsNullOrEmpty(id))
            {
                using (HttpWebResponse response = TP01RestApiWebCall.CallGetRestaurantByIdSynchronous(id))
                {
                    // Get the stream associated with the response.
                    Stream receiveStream = response.GetResponseStream();

                    // Pipes the stream to a higher level stream reader with the required encoding format. 
                    using (StreamReader readStream = new StreamReader(receiveStream, Encoding.UTF8))
                    {
                        returned = JsonConvert.DeserializeObject<Restaurant>(readStream.ReadToEnd());
                    }
                }
            }
            return returned;
        }
    }
}
