using DAL.Model;
using DomoThink.Helper;
using DomoThink.MVVM;
using DomoThink.ViewModels.Interfaces;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
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
        public ObservableCollection<DeviceModel> ConnectedObjects { get; private set; }

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
            this.AddObjectCommand = new Command(this.AddDeviceAction);
            this.SwitchObjectStateCommand = new Command(this.SwitchDeviceStateAction);
            this.LoadCommand = new Command(this.LoadDevicesAction);

            // Initialize connected objets collection
            this.ConnectedObjects = new ObservableCollection<DeviceModel>();
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

        /// <summary>
        /// Loads the connected objects.
        /// </summary>
        private async Task LoadObjects()
        {
            try
            {
                // Activate loading state
                this.LoadingState(true);

                // Clear the connected objects if there's any
                if (this.ConnectedObjects.Any())
                    this.ConnectedObjects.Clear();

                // Send the request to the API
                List<DeviceModel> _objects = await AppContext.DeviceService.GetDevices();
                
                //_objects = new List<ObjectModel>();
                //for (Int32 i = 0; i < 5; i++)
                //    _objects.Add(new ObjectModel(i, "Object #" + i.ToString()));

                // Fill list with the data we recieve from the box
                if (_objects != null)
                {
                    for (Int32 i = 0; i < _objects.Count; ++i)
                    {
                        _objects[i].EditCommand = new Command(this.EditDeviceAction);
                        _objects[i].DeleteCommand = new Command(this.DeleteDeviceAction);
                        _objects[i].ChangeStatusCommand = new Command(this.SwitchDeviceStateAction);
                        this.ConnectedObjects.Add(_objects[i]);
                    }
                }

                // Deactivate loading state
                this.LoadingState(false);
            }
            catch
            {
            }
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Switch to the page to add a new device.
        /// </summary>
        /// <param name="param"></param>
        private void AddDeviceAction(Object param)
        {
            new AddObjectViewModel().Push();
        }

        /// <summary>
        /// Switch device activity sate.
        /// </summary>
        /// <param name="param"></param>
        private async void SwitchDeviceStateAction(Object param)
        {
            var device = param as DeviceModel;

            if (device == null)
                return;

            await AppContext.DeviceService.ChangeStatus(device);
        }

        /// <summary>
        /// Opens the device editor.
        /// </summary>
        /// <param name="param"></param>
        private void EditDeviceAction(Object param)
        {
            new EditObjectViewModel().Push(param);
        }

        /// <summary>
        /// Deletes the selected device.
        /// </summary>
        /// <param name="param"></param>
        private async void DeleteDeviceAction(Object param)
        {
            DeviceModel _device = param as DeviceModel;

            if (_device == null)
                return;
            
            MessageDialog dialog = new MessageDialog(
                "Do you want to delete this object?", 
                "Delete Object");

            dialog.Commands.Add(new UICommand(ResourceHelper.GetString("DialogYes")) { Id = 0 });
            dialog.Commands.Add(new UICommand(ResourceHelper.GetString("DialogNo")) { Id = 1 });

            dialog.DefaultCommandIndex = 0;
            dialog.CancelCommandIndex = 1;

            var result = await dialog.ShowAsync();

            if ((Int32)result.Id == 0) // remove object
            {
                await AppContext.DeviceService.RemoveDevice(_device);
                await this.LoadObjects();
            }
        }

        /// <summary>
        /// Loads all devices.
        /// </summary>
        /// <param name="param"></param>
        private async void LoadDevicesAction(Object param)
        {
            await this.LoadObjects();
        }

        #endregion

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public override void Refresh(Object parameter)
        {
            this.LoadDevicesAction(null);
        }
    }
}
