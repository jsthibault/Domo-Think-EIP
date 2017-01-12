using System;
using System.Diagnostics;
using System.Net.Http;
using System.Net.Http.Headers;
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

namespace DAL.API
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

        /// <summary>
        /// Gets or sets the ApiClient active state.
        /// </summary>
        public Boolean IsActive { get; set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new ApiClient instance.
        /// </summary>
        /// <param name="baseUrl">API url.</param>
        public ApiClient(String baseUrl)
        {
            this.IsActive = true;
            this.BaseUrl = baseUrl;
            this.client = new HttpClient();
            this.client.BaseAddress = new Uri(this.BaseUrl);
            this.client.DefaultRequestHeaders.Accept.Clear();
            this.client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            this.client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/octet-stream"));
        }

        #endregion

        #region METHODS

        public void AddHeader(String header, String value)
        {
            this.client.DefaultRequestHeaders.Add(header, value);
        }

        public async Task<T> Get<T>(String url, params Object[] args)
        {
            try
            {
                if (this.IsActive)
                {
                    HttpResponseMessage _response = await this.client.GetAsync(String.Format(url, args));

                    Debug.WriteLine("Message: " + _response.ReasonPhrase.ToString());

                    var test = await _response.Content.ReadAsStringAsync();
                    
                    if (_response.IsSuccessStatusCode)
                        return await _response.Content.ReadAsAsync<T>();
                }
            }
            catch (Exception e) { }

            return default(T);
        }

        public async Task<U> Post<T, U>(String url, T value)
        {
            try
            {
                if (this.IsActive)
                {
                    HttpResponseMessage _response = await this.client.PostAsJsonAsync(url, value);

                    if (_response.IsSuccessStatusCode)
                        return await _response.Content.ReadAsAsync<U>();
                }
            }
            catch (Exception e) { }

            return default(U);
        }

        public async Task<T> Put<T>(String url, T value)
        {
            try
            {
                if (this.IsActive)
                {
                    HttpResponseMessage _response = await this.client.PutAsJsonAsync(url, value);
                }
            }
            catch (Exception e) { }

            return default(T);
        }

        public async Task<T> Delete<T>(String url, params Object[] args)
        {
            try
            {
                if (this.IsActive)
                {
                    HttpResponseMessage _response = await this.client.DeleteAsync(String.Format(url, args));
                }
            }
            catch (Exception e) { }

            return default(T);
        }

        #endregion
    }
}
