using DomoThink.Model;
using DomoThink.MVVM;
using DomoAPI.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using DomoThink.ViewModels.Interfaces;


/*--------------------------------------------------------
 * AddObjectViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 13/12/2015 13:53:10
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels
{
    public class AddObjectViewModel : ViewModelBase, ILoader
    {
        #region FIELDS
        
        private Boolean loading;
        private Boolean display;

        #endregion

        #region PROPERTIES
        
        /// <summary>
        /// 
        /// </summary>
        public ObservableCollection<ObjectModel> AvailiableObjects { get; private set; }

        /// <summary>
        /// Gets or sets the loading state.
        /// </summary>
        public Boolean Loading
        {
            get { return this.loading; }
            set { this.NotifyPropertyChanged(ref this.loading, value); }
        }

        /// <summary>
        /// Gets or sets the display state.
        /// </summary>
        public Boolean Display
        {
            get { return this.display; }
            set { this.NotifyPropertyChanged(ref this.display, value); }
        }

        /// <summary>
        /// Gets or sets the Load command.
        /// </summary>
        public ICommand LoadCommand { get; set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Create a new AddObjectViewModel instance.
        /// </summary>
        public AddObjectViewModel()
        {
            // Set the loading state to true (default at the begining)
            this.SetLoadingState(true);

            // Initialize the commands
            this.LoadCommand = new Command(this.LoadAction);

            // Initialize the collection
            this.AvailiableObjects = new ObservableCollection<ObjectModel>();
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Set the loading state.
        /// </summary>
        /// <param name="state">Loading state.</param>
        private void SetLoadingState(Boolean state)
        {
            this.Loading = state;
            this.Display = !state;
        }

        #endregion

        #region ACTIONS

        private async void LoadAction(Object param)
        {
            this.SetLoadingState(true);

            await Task.Delay(3000);

            this.SetLoadingState(false);
        }

        #endregion
    }
}
