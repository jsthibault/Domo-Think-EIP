using Domo_Think.Model;
using Domo_Think.MVVM;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * StoreViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 29/12/2015 13:58:42
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.ViewModels
{
    public class StoreViewModel : ViewModelBase
    {
        #region FIELDS



        #endregion

        #region PROPERTIES

        public ObservableCollection<StoreAppModel> Apps { get; private set; }

        #endregion

        #region CONSTRUCTORS

        public StoreViewModel()
        {
            this.Apps = new ObservableCollection<StoreAppModel>();

            for (int i = 0; i < 10; i++)
            {
                this.Apps.Add(new StoreAppModel()
                {
                    Id = i,
                    Name = "AppName #" + i.ToString(),
                    Rate = 3
                });
            }
        }

        #endregion

        #region METHODS



        #endregion
    }
}
