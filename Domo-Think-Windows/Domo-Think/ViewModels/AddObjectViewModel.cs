using Domo_Think.Model;
using Domo_Think.MVVM;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;


/*--------------------------------------------------------
 * AddObjectViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 13/12/2015 13:53:10
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.ViewModels
{
    public class AddObjectViewModel : ViewModelBase
    {
        #region FIELDS

        private Boolean loaderVisible;
        private Boolean devicesVisible;

        #endregion

        #region PROPERTIES

        public Boolean LoaderVisible
        {
            get { return this.loaderVisible; }
            set { this.NotifyPropertyChanged(ref this.loaderVisible, value); }
        }


        public Boolean DevicesVisible
        {
            get { return this.devicesVisible; }
            set { this.NotifyPropertyChanged(ref this.devicesVisible, value); }
        }

        public ICommand SeatchDevicesCommand { get; private set; }

        public ObservableCollection<ObjectModel> Objects { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// 
        /// </summary>
        public AddObjectViewModel()
        {
            this.LoaderVisible = true;
            this.DevicesVisible = false;

            // Initialize commands
            this.SeatchDevicesCommand = new Command(this.SearchDevicesCommandAction);

            this.Objects = new ObservableCollection<ObjectModel>();
            for (Int32 i = 5; i < 9; ++i)
            {
                this.Objects.Add(new ObjectModel()
                {
                    Name = "Object #" + i.ToString()
                });
            }
        }

        #endregion

        #region METHODS

        #endregion

        #region ACTIONS

        /// <summary>
        /// 
        /// </summary>
        /// <param name="param"></param>
        private async void SearchDevicesCommandAction(Object param)
        {
            await Task.Delay(5000);
            this.LoaderVisible = false;
            this.DevicesVisible = true;
        }

        #endregion
    }
}
