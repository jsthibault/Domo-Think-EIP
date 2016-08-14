using DAL.Model;
using DomoThink.API;
using DomoThink.MVVM;
using DomoThink.Navigation;
using DomoThink.ViewModels.Interfaces;
using DomoThink.Views.Objects;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Input;
using Windows.UI.Popups;

/*--------------------------------------------------------
 * ObjectsViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 11/12/2015 15:56:28
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Objects
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
            this.objectService = new ObjectService(new DAL.API.ApiClient("http://127.0.0.1:8080"));
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
            try
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
                    {
                        _objects[i].EditCommand = new Command(this.EditObjectAction);
                        _objects[i].DeleteCommand = new Command(this.DeleteObjectAction);
                        this.ConnectedObjects.Add(_objects[i]);
                    }
                }

                // Deactivate loading state
                this.LoadingState(false);
            }
            catch (Exception e)
            {
            }
        }

        private void EditObjectAction(Object param)
        {
            //var loader = new Windows.ApplicationModel.Resources.ResourceLoader();

            //MessageDialog dialog = new MessageDialog(
            //    "This feature is not implemented yet.",
            //    "Not implemented");

            //dialog.Commands.Add(new UICommand("OK") { Id = 0 });

            //dialog.DefaultCommandIndex = 0;

            //var result = await dialog.ShowAsync();

            NavigationService.Navigate(typeof(ObjectEditor), param as ObjectModel);
        }

        private async void DeleteObjectAction(Object param)
        {
            ObjectModel _object = param as ObjectModel;

            if (_object == null)
                return;

            var loader = new Windows.ApplicationModel.Resources.ResourceLoader();

            MessageDialog dialog = new MessageDialog(
                "Do you want to delete this object?", 
                "Delete Object");

            dialog.Commands.Add(new UICommand(loader.GetString("DialogYes")) { Id = 0 });
            dialog.Commands.Add(new UICommand(loader.GetString("DialogNo")) { Id = 1 });

            dialog.DefaultCommandIndex = 0;
            dialog.CancelCommandIndex = 1;

            var result = await dialog.ShowAsync();

            if ((Int32)result.Id == 0) // remove object
            {
                await this.objectService.DeleteObject(_object);
                this.LoadObjectsAction(null);
            }
        }

        #endregion
    }
}
