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
        private Boolean loaderVisible;
        public Boolean LoaderVisible
        {
            get { return this.loaderVisible; }
            set { this.NotifyPropertyChanged(ref this.loaderVisible, value); }
        }


        private Boolean devicesVisible;
        public Boolean DevicesVisible
        {
            get { return this.devicesVisible; }
            set { this.NotifyPropertyChanged(ref this.devicesVisible, value); }
        }

        public ICommand SeatchDevicesCommand { get; private set; }

        public ObservableCollection<ObjectModel> Objects { get; private set; }

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

        private async void SearchDevicesCommandAction(Object param)
        {
            await Task.Delay(5000);
            this.LoaderVisible = false;
            this.DevicesVisible = true;
        }
    }
}
