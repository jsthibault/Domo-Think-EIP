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

namespace DomoThink.ViewModels.Store
{
    public class StoreViewModel : ViewModelBase, ILoader
    {
        public bool display;
        public bool loading;

        public bool Display
        {
            get { return this.display; }
            set { this.NotifyPropertyChanged(ref this.display, value); }
        }

        public bool Loading
        {
            get { return this.loading; }
            set { this.NotifyPropertyChanged(ref this.loading, value); }
        }

        public ICommand LoadCommand { get; set; }

        public ICommand OnPluginSelectedCommand { get; private set; }

        /// <summary>
        /// Gets the plugins list.
        /// </summary>
        public ObservableCollection<PluginModel> Plugins { get; private set; }


        /// <summary>
        /// Creates a new StoreViewModel instance.
        /// </summary>
        public StoreViewModel()
        {
            this.Plugins = new ObservableCollection<PluginModel>();

            this.OnPluginSelectedCommand = new Command(this.OnPluginSelectedAction);
        }


        private void OnPluginSelectedAction(object param)
        {
            int selectedPluginId = (int)param;
            var pluginModel = this.Plugins.FirstOrDefault(x => x.Id == selectedPluginId);

            if (pluginModel != null)
                new PluginViewModel().Push(pluginModel);
        }

        private async void LoadStorePlugins()
        {
            this.Loading = true;
            this.Display = false;

            var storePlugins = await AppContext.StoreService.GetPlugins();

            if (this.Plugins.Any())
                this.Plugins.Clear();

            if (storePlugins != null)
                foreach (PluginModel storePlugin in storePlugins)
                    this.Plugins.Add(storePlugin);

            this.Loading = false;
            this.Display = true;
        }


        public override void Refresh(object parameter)
        {
            this.LoadStorePlugins();
        }
    }
}
