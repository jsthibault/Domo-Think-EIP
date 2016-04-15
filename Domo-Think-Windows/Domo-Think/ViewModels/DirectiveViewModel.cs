using Domo_Think.API;
using Domo_Think.Model;
using Domo_Think.MVVM;
using Domo_Think.Navigation;
using DomoAPI.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

/*--------------------------------------------------------
 * DirectiveViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 29/12/2015 14:19:18
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.ViewModels
{
    public class DirectiveViewModel : ViewModelBase
    {
        #region FIELDS

        private Boolean loadingDirectives;
        private Boolean displayDirectives;

        private DirectiveService directiveService;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the loading visibility state.
        /// </summary>
        public Boolean LoadingDirectives
        {
            get { return this.loadingDirectives; }
            set { this.NotifyPropertyChanged(ref this.loadingDirectives, value); }
        }

        /// <summary>
        /// Gets or sets the display directive visibility state.
        /// </summary>
        public Boolean DisplayDirectives
        {
            get { return this.displayDirectives; }
            set { this.NotifyPropertyChanged(ref this.displayDirectives, value); }
        }

        /// <summary>
        /// Gets the Add directive command.
        /// </summary>
        public ICommand AddDirectiveCommand { get; private set; }

        /// <summary>
        /// Gets the load/reload directives command.
        /// </summary>
        public ICommand LoadDirectivesCommand { get; private set; }

        /// <summary>
        /// Gets the directives list.
        /// </summary>
        public ObservableCollection<DirectiveModel> Directives { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Create a new Objects View Model instance.
        /// </summary>
        public DirectiveViewModel()
        {
            // Initialiaze the commands
            this.AddDirectiveCommand = new Command(this.AddDirectiveCommandAction);
            this.LoadDirectivesCommand = new Command(this.LoadDirectivesCommandAction);

            // Initialize connected objets collection
            this.Directives = new ObservableCollection<DirectiveModel>();

            // Initialize different view states
            this.LoadingDirectives = true;
            this.DisplayDirectives = !this.LoadingDirectives;

            // Initialize service
            this.directiveService = new DirectiveService(App.ApiClient);
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Sets the loading state.
        /// </summary>
        /// <param name="state">Loading state.</param>
        private void LoadingState(Boolean state)
        {
            this.LoadingDirectives = state;
            this.DisplayDirectives = !state;
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Switch to the page to add a new object.
        /// </summary>
        /// <param name="param"></param>
        private void AddDirectiveCommandAction(Object param)
        {
            // TODO: navigate to the add directive page
        }

        /// <summary>
        /// Loads or reloads the object list.
        /// </summary>
        /// <param name="param"></param>
        private async void LoadDirectivesCommandAction(Object param)
        {
            // Activate loading state
            this.LoadingState(true);

            // Clear the directive list if there's any
            if (this.Directives.Any())
                this.Directives.Clear();

            // Send the request to the API
            List<DirectiveModel> _directives = await this.directiveService.GetDirectives();

            // Fill list with the data we recieve from the box
            if (_directives != null)
            {
                for (Int32 i = 0; i < _directives.Count; ++i)
                    this.Directives.Add(_directives[i]);
            }

            // Deactivate loading state
            this.LoadingState(false);
        }

        #endregion
    }
}
