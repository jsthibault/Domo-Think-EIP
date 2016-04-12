using Domo_Think.MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

/*--------------------------------------------------------
 * MainViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 04/03/2016 13:04:39
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.ViewModels
{
    public class MainViewModel : ViewModelBase
    {
        #region CONSTANTS



        #endregion

        #region ENUMS



        #endregion

        #region FIELDS

        private String echoName;

        #endregion

        #region PROPERTIES

        public String EchoName
        {
            get { return this.echoName; }
            set { this.NotifyPropertyChanged(ref this.echoName, value); }
        }

        public ICommand EchoApiCommand { get; private set; }
        public Object DomoApi { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new MainViewModel instance.
        /// </summary>
        public MainViewModel()
        {
            this.EchoName = String.Empty;

            // Initialize command
            this.EchoApiCommand = new Command(this.EchoApiAction);
        }

        #endregion

        #region METHODS



        #endregion

        #region ACTIONS

        public struct ApiResponse
        {
            public String Result;
            public Object ObjResult;
        }

        private async void EchoApiAction(Object param)
        {
            //DomoAPI _api = new DomoAPI(Constants.API_ADDRESS);
            //ApiResponse _result = await _api.Get<ApiResponse>("/api/Login/GetUsername?username={0}", param.ToString());

            //this.EchoName = String.Format("'{0}'", _result.ObjResult.ToString());
        }

        #endregion
    }
}
