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
using DomoThink.API;
using DomoThink.Navigation;
using DomoThink.Helper;


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
        public ObservableCollection<DeviceModel> AvailiableObjects { get; private set; }

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
            this.AddObjectCommand = new Command(this.AddObjectAction);
            this.LoadCommand = new Command(param => this.LoadObjects());

            // Initialize the collection
            this.AvailiableObjects = new ObservableCollection<DeviceModel>();
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

        /// <summary>
        /// Load objects.
        /// </summary>
        private async void LoadObjects()
        {
            try
            {
                this.SetLoadingState(true);

                if (this.AvailiableObjects.Any())
                    this.AvailiableObjects.Clear();
                
                var devices = await AppContext.DeviceService.ScanDevices();

                if (devices != null)
                {
                    for (int i = 0; i < devices.Length; ++i)
                        this.AvailiableObjects.Add(devices[i]);

                    for (int i = 0; i < devices.Length; ++i)
                        this.AvailiableObjects[i].AddCommand = new Command(this.AddObjectAction);
                }

                this.SetLoadingState(false);
            }
            catch { }
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Add the selected object to the DomoBox.
        /// </summary>
        /// <param name="param"></param>
        private async void AddObjectAction(Object param)
        {
            try
            {
                Boolean _result = await AppContext.DeviceService.AddDevice(param as DeviceModel);

                if (_result)
                {
                    NotificationHelper.ShowToastNotification(
                        ResourceHelper.GetString("AddObject"),
                        ResourceHelper.GetString("AddObjectSuccess"));
                }
                else
                {
                    NotificationHelper.ShowToastNotification(
                        ResourceHelper.GetString("AddObject"),
                        ResourceHelper.GetString("AddObjectError"));
                }

                this.Pop();
            }
            catch { }
        }

        #endregion

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public override void Refresh(Object parameter)
        {
            this.LoadObjects();
        }
    }
}
