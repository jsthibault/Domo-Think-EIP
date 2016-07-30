using DomoThink.API;
using DomoThink.Model;
using DomoThink.MVVM;
using DomoThink.Navigation;
using DomoThink.ViewModels.Interfaces;
using DAL.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Windows.UI.Popups;
using DomoThink.Views.Directives;

/*--------------------------------------------------------
 * DirectiveViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 29/12/2015 14:19:18
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels
{
    public class DirectiveViewModel : ViewModelBase, ILoader
    {
        #region FIELDS

        private Boolean loading;
        private Boolean display;

        private DirectiveService directiveService;

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
        /// Gets the Add directive command.
        /// </summary>
        public ICommand AddDirectiveCommand { get; private set; }

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
            this.LoadCommand = new Command(this.LoadDirectivesCommandAction);

            // Initialize connected objets collection
            this.Directives = new ObservableCollection<DirectiveModel>();

            // Initialize service
            this.directiveService = new DirectiveService(new DAL.API.ApiClient("http://127.0.0.1:8080"));
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
        private void AddDirectiveCommandAction(Object param)
        {
            NavigationService.Navigate(typeof(DirectiveEditor));
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
                {
                    _directives[i].EditCommand = new Command(this.EditDirectiveAction);
                    _directives[i].DeleteCommand = new Command(this.DeleteDirectiveAction);
                    this.Directives.Add(_directives[i]);
                }
            }

            // Deactivate loading state
            this.LoadingState(false);
        }

        private void EditDirectiveAction(Object param)
        {
            NavigationService.Navigate(typeof(DirectiveEditor), param);
        }

        private async void DeleteDirectiveAction(Object param)
        {
            DirectiveModel _directive = param as DirectiveModel;

            if (_directive == null)
                return;

            var loader = new Windows.ApplicationModel.Resources.ResourceLoader();

            MessageDialog dialog = new MessageDialog(
                "Do you want to delete this directive?",
                "Delete Directive");

            dialog.Commands.Add(new UICommand(loader.GetString("DialogYes")) { Id = 0 });
            dialog.Commands.Add(new UICommand(loader.GetString("DialogNo")) { Id = 1 });

            dialog.DefaultCommandIndex = 0;
            dialog.CancelCommandIndex = 1;

            var result = await dialog.ShowAsync();

            if ((Int32)result.Id == 0) // remove object
            {
                await this.directiveService.DeleteDirective(_directive);
                this.LoadDirectivesCommandAction(null);
            }
        }

        #endregion
    }
}
