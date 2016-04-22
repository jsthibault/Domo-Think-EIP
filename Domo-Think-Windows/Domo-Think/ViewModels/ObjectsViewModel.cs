using Domo_Think.API;
using Domo_Think.Model;
using Domo_Think.MVVM;
using Domo_Think.Navigation;
using Domo_Think.ViewModels.Interfaces;
using DomoAPI.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Windows.UI.Xaml.Controls;

/*--------------------------------------------------------
 * ObjectsViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 11/12/2015 15:56:28
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.ViewModels
{
    public class ObjectsViewModel : ViewModelBase, ILoader
    {
        #region FIELDS

        private Boolean loading;
        private Boolean display;

        private ObjectService objectService;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets the Add object command.
        /// </summary>
        public ICommand AddObjectCommand { get; private set; }

        /// <summary>
        /// Gets the load/reload object command.
        /// </summary>
        public ICommand LoadObjectsCommand { get; private set; }

        /// <summary>
        /// Gets the switch state command of an object.
        /// </summary>
        public ICommand SwitchObjectStateCommand { get; private set; }

        /// <summary>
        /// Gets the connected objects list.
        /// </summary>
        public ObservableCollection<ObjectModel> ConnectedObjects { get; private set; }

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
        /// Create a new Objects View Model instance.
        /// </summary>
        public ObjectsViewModel()
        {
            // Initialiaze the commands
            this.LoadCommand = new Command(this.LoadObjectsAction);
            this.AddObjectCommand = new Command(this.AddObjectAction);
            this.SwitchObjectStateCommand = new Command(this.SwitchObjectStateAction);

            // Initialize connected objets collection
            this.ConnectedObjects = new ObservableCollection<ObjectModel>();

            // Initialize API service
            this.objectService = new ObjectService(App.ApiClient);
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Sets the loading state.
        /// </summary>
        /// <param name="state">Loading state.</param>
        private void LoadingState(Boolean state)
        {
            this.Loading = state;
            this.Display = !state;
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Switch to the page to add a new object.
        /// </summary>
        /// <param name="param"></param>
        private void AddObjectAction(Object param)
        {
            NavigationService.Navigate(typeof(Views.Objects.AddObject));
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="param"></param>
        private void SwitchObjectStateAction(Object param)
        {
            // Change object state here
        }

        /// <summary>
        /// Loads or reloads the object list.
        /// </summary>
        /// <param name="param"></param>
        private async void LoadObjectsAction(Object param)
        {
            // Activate loading state
            this.LoadingState(true);

            // Clear the connected objects if there's any
            if (this.ConnectedObjects.Any())
                this.ConnectedObjects.Clear();

            // Send the request to the API
            List<ObjectModel> _objects = await this.objectService.GetObjects();

            // Fill list with the data we recieve from the box
            if (_objects != null)
            {
                for (Int32 i = 0; i < _objects.Count; ++i)
                    this.ConnectedObjects.Add(_objects[i]);
            }
            
            // Deactivate loading state
            this.LoadingState(false);
        }

        #endregion
    }
}
