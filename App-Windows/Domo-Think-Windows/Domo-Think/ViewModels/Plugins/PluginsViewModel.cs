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
        #region FIELDS

        private Boolean display;
        private Boolean loading;

        #endregion

        #region PROPERTIES

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

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new Plugins instance.
        /// </summary>
        public PluginsViewModel()
        {
            // Create the collection
            this.Plugins = new ObservableCollection<PluginModel>();
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
        /// Loads the plugins.
        /// </summary>
        private void LoadPlugins()
        {
            // Set loading state to true during loading
            this.LoadingState(true);

            // TODO: load plugins

            if (this.Plugins.Any())
                this.Plugins.Clear();

            for (Int32 i = 0; i < 5; ++i)
                this.Plugins.Add(new PluginModel(i, "Plugin #" + i.ToString(), 3, false));

            // Set loading state to false after loading
            this.LoadingState(false);
        }

        #endregion

        #region ACTIONS

        #endregion

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public override void Refresh(Object parameter)
        {
            this.LoadPlugins();
        }
    }
}
