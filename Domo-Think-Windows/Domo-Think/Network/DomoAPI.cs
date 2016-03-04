using System;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * DomoAPI.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 02/03/2016 18:16:03
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.Network
{
    public class DomoAPI
    {
        #region CONSTANTS



        #endregion

        #region ENUMS



        #endregion

        #region FIELDS

        private HttpClient client;

        #endregion

        #region PROPERTIES



        #endregion

        #region CONSTRUCTORS

        public DomoAPI(String url)
        {
            this.client = new HttpClient();
            this.client.BaseAddress = new Uri(url);
            this.client.DefaultRequestHeaders.Accept.Clear();
            this.client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        #endregion

        #region METHODS

        public async Task<T> Get<T>(String url, params Object[] args)
        {
            HttpResponseMessage _response = await this.client.GetAsync(String.Format(url, args));

            if (_response.IsSuccessStatusCode)
                return await _response.Content.ReadAsAsync<T>();

            return default(T);
        }

        public async Task<HttpStatusCode> Post<T>(String url, T value)
        {
            HttpResponseMessage _response = await this.client.PostAsJsonAsync(url, value);

            if (_response.IsSuccessStatusCode)
                return _response.StatusCode;

            return HttpStatusCode.NotImplemented;
        }

        public void Put()
        {
        }

        public void Delete()
        {
        }

        #endregion
    }
}
