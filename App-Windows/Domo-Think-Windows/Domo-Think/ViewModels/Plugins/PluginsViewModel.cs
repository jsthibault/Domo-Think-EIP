using DAL.Model;
using DomoThink.MVVM;
using DomoThink.ViewModels.Interfaces;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace DomoThink.ViewModels.Plugins
{
    public class PluginsViewModel : ViewModelBase, ILoader
    {
        private Boolean display;
        private Boolean loading;

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
        /// Gets or sets the plugins collection.
        /// </summary>
        public ObservableCollection<PluginModel> Plugins { get; set; }
        
        
        /// <summary>
        /// Creates a new Plugins instance.
        /// </summary>
        public PluginsViewModel()
        {
            // Create the collection
            this.Plugins = new ObservableCollection<PluginModel>();

            this.LoadCommand = new Command(async (param) => await this.LoadPlugins());
        }
        
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
        /// Loads the plugins.
        /// </summary>
        private async Task LoadPlugins()
        {
            // Set loading state to true during loading
            this.LoadingState(true);

            var plugins = await AppContext.PluginService.GetPlugins();

            if (this.Plugins.Any())
                this.Plugins.Clear();

            for (int i = 0; i < plugins.Count; ++i)
            {
                plugins[i].ChangeStatusCommand = new Command(this.ChangeStatusAction);
                plugins[i].UninstallCommand = new Command(this.UninstallAction);
                this.Plugins.Add(plugins[i]);
            }
            
            this.LoadingState(false);
        }

        private void ChangeStatusAction(object param)
        {
            var plugin = param as PluginModel;

            if (plugin == null)
                return;

            AppContext.PluginService.ChangeStatus(plugin);
        }

        public void UninstallAction(object param)
        {
            var plugin = param as PluginModel;

            if (plugin == null)
                return;

            AppContext.PluginService.Remove(plugin);
        }

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public async override void Refresh(Object parameter)
        {
            await this.LoadPlugins();
        }
    }
}
