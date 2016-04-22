using Domo_Think.API;
using Domo_Think.Model;
using Domo_Think.MVVM;
using Domo_Think.ViewModels.Interfaces;
using Domo_Think.Views;
using DomoAPI.Model;
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

namespace Domo_Think.ViewModels
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
            this.LoadCommand = new Command(this.LoadPluginsAction);
            this.SeePluginCommand = new Command(this.SeePluginAction);
        }

        #endregion

        #region METHODS



        #endregion

        #region ACTIONS

        /// <summary>
        /// Load the plugin list.
        /// </summary>
        /// <param name="param"></param>
        private async void LoadPluginsAction(Object param)
        {
            this.Loading = true;
            this.Display = false;

            List<PluginModel> _plugins = await this.service.GetPlugins();

            foreach (PluginModel plugin in _plugins)
                this.Plugins.Add(plugin);

            this.Loading = false;
            this.Display = true;
        }

        private async void SeePluginAction(Object param)
        {
            PluginModel _model = null;

            for (Int32 i = 0; i < this.Plugins.Count; ++i)
                if (this.Plugins[i].Id == (Int32)param)
                    _model = this.Plugins[i];

            Navigation.NavigationService.Navigate(typeof(PluginPage), _model);
        }

        #endregion
    }
}
