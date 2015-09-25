using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using TP01WPF.Properties;

namespace TP01WPF.Business.IOServices
{
    public class TP01RestApiWebCall
    {
        /// <summary>
        /// Synchronous Delete
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static HttpWebResponse CallDeleteRestaurantSynchronous(string id)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(String.Format("{0}/{1}",Settings.Default.WSRestoBaseUri, id));
                request.Credentials = CredentialCache.DefaultCredentials;
                request.Method = "DELETE";
            return (HttpWebResponse)request.GetResponse();
        }

        /// <summary>
        /// Synchronous Put
        /// </summary>
        /// <param name="id"></param>
        /// <param name="content"></param>
        /// <returns></returns>
        public static HttpWebResponse CallPutRestaurantSynchronous(string id, string content)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(String.Format("{0}/{1}", Settings.Default.WSRestoBaseUri, id));
            request.Method = "PUT";
            request.ContentType = "application/json";
            request.Credentials = CredentialCache.DefaultCredentials;

            UTF8Encoding encoding = new UTF8Encoding();
            byte[] byte1 = encoding.GetBytes(content);

            // Set the content length of the string being posted.
            request.ContentLength = byte1.Length;

            Stream newStream = request.GetRequestStream();

            newStream.Write(byte1, 0, byte1.Length);

            return (HttpWebResponse)request.GetResponse();
        }

        /// <summary>
        /// Synchronous POST
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public static HttpWebResponse CallPostRestaurantSynchronous(string content)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Settings.Default.WSRestoBaseUri);
            request.Method = "POST";
            request.ContentType = "application/json";
            request.Credentials = CredentialCache.DefaultCredentials;

            UTF8Encoding encoding = new UTF8Encoding();
            byte[] byte1 = encoding.GetBytes(content);

            // Set the content length of the string being posted.
            request.ContentLength = byte1.Length;

            Stream newStream = request.GetRequestStream();

            newStream.Write(byte1, 0, byte1.Length);

            return (HttpWebResponse)request.GetResponse(); 

        }

        /// <summary>
        /// Synchronous GET ALL
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static HttpWebResponse CallGetRestaurantSynchronous(string text)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Settings.Default.WSRestoBaseUri);
            request.Credentials = CredentialCache.DefaultCredentials;
            switch (text)
            {
                case "Json":
                    request.Accept = "application/json";
                    break;

                case "XML":
                    request.Accept = "application/xml";
                    break;

            }

            return (HttpWebResponse)request.GetResponse(); 
        }

        /// <summary>
        /// Synchronous GET
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static HttpWebResponse CallGetRestaurantByIdSynchronous(string id){
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(String.Format("{0}/{1}", Settings.Default.WSRestoBaseUri, id));
            request.Credentials = CredentialCache.DefaultCredentials;

            return (HttpWebResponse)request.GetResponse();
        }

        /// <summary>
        /// Asynchronous Delete
        /// </summary>
        /// <param name="id"></param>
        /// <param name="callBackHandler"></param>
        public static void CallDeleteRestaurantAsynchronous(string id, AsyncCallback callBackHandler)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(String.Format("{0}/{1}", Settings.Default.WSRestoBaseUri, id));
            request.Credentials = CredentialCache.DefaultCredentials;
            request.Method = "DELETE";
            request.BeginGetResponse(callBackHandler, request);
        }

        /// <summary>
        /// Asynchronous Put
        /// </summary>
        /// <param name="id"></param>
        /// <param name="content"></param>
        /// <param name="callBackHandler"></param>
        public static void CallPutRestaurantAsynchronous(string id, string content, AsyncCallback callBackHandler)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(String.Format("{0}/{1}", Settings.Default.WSRestoBaseUri, id));
            request.Method = "PUT";
            request.ContentType = "application/json";
            request.Credentials = CredentialCache.DefaultCredentials;
            UTF8Encoding encoding = new UTF8Encoding();
            byte[] byte1 = encoding.GetBytes(content);
            // Set the content length of the string being posted.
            request.ContentLength = byte1.Length;
            Stream newStream = request.GetRequestStream();
            newStream.Write(byte1, 0, byte1.Length);
            request.BeginGetResponse(callBackHandler, request);
        }

        /// <summary>
        /// Asynchronous POST
        /// </summary>
        /// <param name="content"></param>
        /// <param name="callBackHandler"></param>
        public static void CallPostRestaurantAsynchronous(string content, AsyncCallback callBackHandler)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Settings.Default.WSRestoBaseUri);
            request.Method = "POST";
            request.ContentType = "application/json";
            request.Credentials = CredentialCache.DefaultCredentials;
            UTF8Encoding encoding = new UTF8Encoding();
            byte[] byte1 = encoding.GetBytes(content);
            // Set the content length of the string being posted.
            request.ContentLength = byte1.Length;
            Stream newStream = request.GetRequestStream();
            newStream.Write(byte1, 0, byte1.Length);
            request.BeginGetResponse(callBackHandler, request);
        }

        /// <summary>
        /// Asynchronous GET ALL
        /// </summary>
        /// <param name="text"></param>
        /// <param name="callBackHandler"></param>
        public static void CallGetRestaurantAsynchronous(string text, AsyncCallback callBackHandler)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Settings.Default.WSRestoBaseUri);
            request.Credentials = CredentialCache.DefaultCredentials;
            switch (text)
            {
                case "Json":
                    request.Accept = "application/json";
                    break;
                case "XML":
                    request.Accept = "application/xml";
                    break;
            }
            request.BeginGetResponse(callBackHandler, request);
        }


        /// <summary>
        /// Asynchronous GET
        /// </summary>
        /// <param name="id"></param>
        /// <param name="callBackHandler"></param>
        public static void CallGetRestaurantByIdAsynchronous(string id, AsyncCallback callBackHandler)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(String.Format("{0}/{1}", Settings.Default.WSRestoBaseUri, id));
            request.Credentials = CredentialCache.DefaultCredentials;
            request.BeginGetResponse(callBackHandler, request);
        }
        
    }
}
