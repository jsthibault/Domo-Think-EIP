using DomoThink.API;
using DomoThink.Model;
using DomoThink.MVVM;
using DomoThink.ViewModels.Interfaces;
using DomoThink.Views;
using DAL.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

/*--------------------------------------------------------
 * PluginStoreViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 29/12/2015 13:58:42
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Store
{
    public class PluginStoreViewModel : ViewModelBase, ILoader
    {
        #region FIELDS

        private Boolean loading;
        private Boolean display;

        private PluginService service;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets the plugins list.
        /// </summary>
        public ObservableCollection<PluginModel> Plugins { get; private set; }

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

        public ICommand SeePluginCommand { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new PluginStore view model instance.
        /// </summary>
        public PluginStoreViewModel()
        {
            this.Plugins = new ObservableCollection<PluginModel>();
            this.service = new PluginService(App.ApiClient);

            // Initialize commands
            this.SeePluginCommand = new Command(this.SeePluginAction);
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
        /// Loads the store plugins.
        /// </summary>
        public async void LoadStorePlugins()
        {
            this.Loading = true;
            this.Display = false;

            //List<PluginModel> _plugins = await this.service.GetPlugins();

            //if (_plugins != null)
            //    foreach (PluginModel plugin in _plugins)
            //        this.Plugins.Add(plugin);

            await Task.Delay(1000);

            for (Int32 i = 0; i < 5; ++i)
            {
                this.Plugins.Add(new PluginModel(i, "Plugin #" + i.ToString(), i, false));
            }

            this.Loading = false;
            this.Display = true;
        }

        #endregion

        #region ACTIONS

        private async void SeePluginAction(Object param)
        {
            PluginModel _model = null;

            await Task.Delay(100);

            for (Int32 i = 0; i < this.Plugins.Count; ++i)
                if (this.Plugins[i].Id == (Int32)param)
                    _model = this.Plugins[i];

            new PluginViewModel().Push(_model);
            //Navigation.NavigationService.Navigate(typeof(PluginPage), _model);
        }

        #endregion

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public override void Refresh(Object parameter)
        {
            this.LoadStorePlugins();
        }
    }
}
