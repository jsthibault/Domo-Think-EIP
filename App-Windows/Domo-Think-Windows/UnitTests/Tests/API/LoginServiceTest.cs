using DomoAPI.Client;
using DomoAPI.Model;
using Microsoft.VisualStudio.TestPlatform.UnitTestFramework;
using System;

/*--------------------------------------------------------
 * LoginServiceTest.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 18/04/2016 13:49:46
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace UnitTests.Tests.API
{
    [TestClass]
    public class LoginServiceTest
    {
        /// <summary>
        /// Unit test for: Correct username and password.
        /// </summary>
        /// <remarks>Result should be: "true"</remarks>
        [TestMethod]
        public void LoginCorrectUsernameAndPassword()
        {
            // Connect to the API
            ApiClient _apiClient = new ApiClient(DomoThink.API.APIConstants.API_URL);

            // Create the LoginService
            DomoThink.API.LoginService _service = new DomoThink.API.LoginService(_apiClient);

            // Create the data contract
            LoginModel _model = new LoginModel("gomesp_f", "1234");

            // Send the login request
            Boolean _connected = _service.SendLoginRequest(_model).Result;

            // Result should be "true" otherwise the test is not valid
            Assert.AreEqual(_connected, true);
        }

        /// <summary>
        /// Unit test for: Incorrect login username.
        /// </summary>
        /// <remarks>Result should be: "false"</remarks>
        [TestMethod]
        public void LoginIncorrectUsername()
        {
            // Connect to the API
            ApiClient _apiClient = new ApiClient(DomoThink.API.APIConstants.API_URL);

            // Create the LoginService
            DomoThink.API.LoginService _service = new DomoThink.API.LoginService(_apiClient);

            // Create the data contract
            LoginModel _model = new LoginModel("hello_w", "1234");

            // Send the login request
            Boolean _connected = _service.SendLoginRequest(_model).Result;

            // Result should be "false" otherwise the test is not valid
            Assert.AreEqual(_connected, false);
        }

        /// <summary>
        /// Unit test for: Incorrect login password.
        /// </summary>
        /// <remarks>Result should be: "false"</remarks>
        [TestMethod]
        public void LoginIncorrectPassword()
        {
            // Connect to the API
            ApiClient _apiClient = new ApiClient(DomoThink.API.APIConstants.API_URL);

            // Create the LoginService
            DomoThink.API.LoginService service = new DomoThink.API.LoginService(_apiClient);

            // Create the data contract
            LoginModel _model = new LoginModel("gomesp_f", "4321");

            // Send the login request
            Boolean _connected = service.SendLoginRequest(_model).Result;

            // Result should be "false" otherwise the test is not valid
            Assert.AreEqual(_connected, false);
        }

        /// <summary>
        /// Unit test for: Empty login username.
        /// </summary>
        /// <remarks>Result should be: "false"</remarks>
        [TestMethod]
        public void LoginEmptyUsername()
        {
            // Connect to the API
            ApiClient _apiClient = new ApiClient(DomoThink.API.APIConstants.API_URL);

            // Create the LoginService
            DomoThink.API.LoginService _service = new DomoThink.API.LoginService(_apiClient);

            // Create the data contract
            LoginModel _model = new LoginModel(String.Empty, "4321");

            // Send the login request
            Boolean _connected = _service.SendLoginRequest(_model).Result;

            // Result should be "false" otherwise the test is not valid
            Assert.AreEqual(_connected, false);
        }


        /// <summary>
        /// Unit test for: Emtpy login password.
        /// </summary>
        /// <remarks>Result should be: "false"</remarks>
        [TestMethod]
        public void LoginEmptyPassword()
        {
            // Connect to the API
            ApiClient _apiClient = new ApiClient(DomoThink.API.APIConstants.API_URL);

            // Create the LoginService
            DomoThink.API.LoginService _service = new DomoThink.API.LoginService(_apiClient);

            // Create the data contract
            LoginModel _model = new LoginModel("gomesp_f", String.Empty);

            // Send the login request
            Boolean _connected = _service.SendLoginRequest(_model).Result;

            // Result should be "false" otherwise the test is not valid
            Assert.AreEqual(_connected, false);
        }


        /// <summary>
        /// Unit test for: Empty login username and password.
        /// </summary>
        /// <remarks>Result should be: "false"</remarks>
        [TestMethod]
        public void LoginEmptyUsernameAndPassword()
        {
            // Connect to the API
            ApiClient _apiClient = new ApiClient(DomoThink.API.APIConstants.API_URL);

            // Create the LoginService
            DomoThink.API.LoginService _service = new DomoThink.API.LoginService(_apiClient);

            // Create the data contract
            LoginModel _model = new LoginModel(String.Empty, String.Empty);

            // Send the login request
            Boolean _connected = _service.SendLoginRequest(_model).Result;

            // Result should be "false" otherwise the test is not valid
            Assert.AreEqual(_connected, false);
        }

        /// <summary>
        /// Unit test for: Login to distant API.
        /// </summary>
        /// <remarks>Result should be: "true"</remarks>
        [TestMethod]
        public void LoginToDistantAPI()
        {
            // Connect to the API
            ApiClient _apiClient = new ApiClient("http://89.156.151.77:4242");

            // Create the LoginService
            DomoThink.API.LoginService _service = new DomoThink.API.LoginService(_apiClient);

            // Create the data contract
            LoginModel _model = new LoginModel("guenno_v", "1234");

            // Send the login request
            Object obj = _apiClient.Post<LoginModel, Object>("/user/connect", _model);

            // Result should be "true" otherwise the test is not valid
            Assert.AreNotEqual(obj, null);
        }
    }
}
