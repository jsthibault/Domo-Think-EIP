using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * ApiClient.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 02/03/2016 18:16:03
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoAPI.Client
{
    public class ApiClient
    {
        #region CONSTANTS



        #endregion

        #region ENUMS



        #endregion

        #region FIELDS

        private HttpClient client;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets the API base url.
        /// </summary>
        public String BaseUrl { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new ApiClient instance.
        /// </summary>
        /// <param name="baseUrl">API url.</param>
        public ApiClient(String baseUrl)
        {
            this.BaseUrl = baseUrl;
            this.client = new HttpClient();
            this.client.BaseAddress = new Uri(this.BaseUrl);
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

        public async Task<U> Post<T, U>(String url, T value)
        {
            HttpResponseMessage _response = await this.client.PostAsJsonAsync(url, value);

            if (_response.IsSuccessStatusCode)
                return await _response.Content.ReadAsAsync<U>();

            return default(U);
        }

        #endregion
    }
}
