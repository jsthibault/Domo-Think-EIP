using DomoThink.Model;
using DomoThink.MVVM;
using DAL.Model;
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

namespace DomoThink.ViewModels.Objects
{
    public class AddObjectViewModel : ViewModelBase, ILoader
    {
        #region FIELDS
        
        private Boolean loading;
        private Boolean display;

        #endregion

        #region PROPERTIES
        
        /// <summary>
        /// Gets the availiable objects collection.
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

        /// <summary>
        /// Gets the Add command.
        /// </summary>
        public ICommand AddObjectCommand { get; private set; }

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
            this.AddObjectCommand = new Command(this.AddObjectAction);

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

        /// <summary>
        /// Send an API request to the DomoBox to get the objects near.
        /// </summary>
        /// <param name="param"></param>
        private async void LoadAction(Object param)
        {
            this.SetLoadingState(true);

            if (this.AvailiableObjects.Any())
                this.AvailiableObjects.Clear();

            // TODO: API request to get the objects near the DomoBox.

            await Task.Delay(3000);

            for (Int32 i = 0; i < 5; ++i)
                this.AvailiableObjects.Add(new ObjectModel(i, "Availiable Object #" + i.ToString()));

            this.SetLoadingState(false);
        }

        private void AddObjectAction(Object param)
        {

        }

        #endregion
    }
}
