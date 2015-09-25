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
    class TP02RestApiWebCall
    {
        /// <summary>
        /// Synchronous Get
        /// </summary>
        /// <returns></returns>
        public static HttpWebResponse CallGetAbonneeSynchronous()
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Settings.Default.WSAboBaseUri);
            request.Credentials = CredentialCache.DefaultCredentials;
            request.Method = "GET";
            return (HttpWebResponse)request.GetResponse();
        }

        /// <summary>
        /// Synchronous Put
        /// </summary>
        /// <param name="id"></param>
        /// <param name="content"></param>
        /// <returns></returns>
        public static HttpWebResponse CallPutAbonneSynchronous(int id, string content)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(String.Format("{0}/{1}", Settings.Default.WSAboBaseUri, id));
            request.Method = "PUT";
            request.ContentType = "application/json";
            request.Credentials = CredentialCache.DefaultCredentials;

            UTF8Encoding encoding = new UTF8Encoding();
            byte[] byte1 = encoding.GetBytes(content);
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
        public static HttpWebResponse CallPostAbonneSynchronous(string content)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Settings.Default.WSAboBaseUri);
            request.Method = "POST";
            request.ContentType = "application/json";
            request.Credentials = CredentialCache.DefaultCredentials;

            UTF8Encoding encoding = new UTF8Encoding();
            byte[] byte1 = encoding.GetBytes(content);
            request.ContentLength = byte1.Length;
            Stream newStream = request.GetRequestStream();
            newStream.Write(byte1, 0, byte1.Length);

            return (HttpWebResponse)request.GetResponse();

        }
    }
}
