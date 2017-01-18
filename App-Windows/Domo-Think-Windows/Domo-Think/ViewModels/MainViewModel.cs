using DAL.Model;
using DomoThink.MVVM;
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

namespace DomoThink.ViewModels
{
    public class MainViewModel : ViewModelBase
    {
        private BoxStatusModel boxStatus;

        public BoxStatusModel BoxStatus
        {
            get { return this.boxStatus; }
            set { this.NotifyPropertyChanged(ref this.boxStatus, value); }
        }
        
        /// <summary>
        /// Creates a new MainViewModel instance.
        /// </summary>
        public MainViewModel()
        {
        }

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public async override void Refresh(object parameter)
        {
            this.BoxStatus = await AppContext.BoxService.GetStatus();
        }
    }
}
