using Domo_Think.MVVM;
using Domo_Think.Network;
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

        public MainViewModel()
        {
            this.EchoName = String.Empty;
            this.EchoApiCommand = new Command(this.EchoApiAction);
        }

        #endregion

        #region METHODS



        #endregion

        #region ACTIONS

        private async void EchoApiAction(Object param)
        {
            DomoAPI _api = new DomoAPI(Constants.API_ADDRESS);
            String _result = await _api.Get<String>("/api/Login/GetUsername?username={0}", param.ToString());

            this.EchoName = _result;
        }

        #endregion
    }
}
