using DAL.Model;
using DomoThink.API;
using DomoThink.MVVM;
using DomoThink.Navigation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

/*--------------------------------------------------------
 * EditObjectViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 10/09/2016 18:08:15
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Objects
{
    public class EditObjectViewModel : ViewModelBase
    {
        #region FIELDS

        private ObjectModel objectInformations;
        private ObjectService objectService;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the Object informations.
        /// </summary>
        public ObjectModel ObjectInformations
        {
            get { return this.objectInformations; }
            set { this.NotifyPropertyChanged(ref this.objectInformations, value); }
        }

        /// <summary>
        /// Gets the edit object command.
        /// </summary>
        public ICommand EditObjectCommand { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new EditObjectViewModel instance.
        /// </summary>
        public EditObjectViewModel()
        {
            // Initialize API service
            this.objectService = new ObjectService(App.ApiClient);

            // Initialize the commands
            this.EditObjectCommand = new Command(this.EditObjectAction);
        }

        #endregion

        #region METHODS



        #endregion

        #region ACTIONS

        private async void EditObjectAction(Object param)
        {
            try
            {
                Boolean result = await this.objectService.UpdateObject(this.ObjectInformations);

                if (result)
                {
                }
                else
                {
                }

                NavigationService.GoBack();
            }
            catch
            {
            }
        }

        #endregion
    }
}
