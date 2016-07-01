using DomoThink.MVVM;
using DomoThink.ViewModels.Interfaces;
using DAL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;


/*--------------------------------------------------------
 * PluginViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 22/04/2016 19:17:45
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels
{
    public class PluginViewModel : ViewModelBase, ILoader
    {
        #region FIELDS

        private Boolean loading;
        private Boolean display;

        private PluginModel model;

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
        /// Gets or sets the model.
        /// </summary>
        public PluginModel Model
        {
            get { return this.model; }
            set { this.NotifyPropertyChanged(ref this.model, value); }
        }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates the 
        /// </summary>
        public PluginViewModel()
        {
            this.model = new PluginModel();

            // Initialize commands
            this.LoadCommand = new Command(this.LoadPluginInformationAction);
        }

        #endregion

        #region METHODS



        #endregion

        #region ACTIONS

        private async void LoadPluginInformationAction(Object parameter)
        {
            await Task.Delay(2000);
        }

        #endregion
    }
}
