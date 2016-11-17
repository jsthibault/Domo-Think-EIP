using DomoThink.MVVM;
using DomoThink.ViewModels.Interfaces;
using DAL.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Collections.ObjectModel;
using DomoThink.Views.Store;


/*--------------------------------------------------------
 * PluginViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 22/04/2016 19:17:45
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Store
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

        public ICommand InstallCommand { get; set; }

        public ICommand CommentCommand { get; set; }

        /// <summary>
        /// Gets or sets the model.
        /// </summary>
        public PluginModel Model
        {
            get { return this.model; }
            set { this.NotifyPropertyChanged(ref this.model, value); }
        }

        /// <summary>
        /// Gets or sets the plugin's comment collection.
        /// </summary>
        public ObservableCollection<PluginComment> Comments { get; set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates the Plugin view model instance.
        /// </summary>
        public PluginViewModel()
        {
            this.model = new PluginModel();
            this.Comments = new ObservableCollection<PluginComment>();

            this.CommentCommand = new Command(this.OnCommentAction);
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Load plugin comments.
        /// </summary>
        private async void LoadPluginComments()
        {
            var pluginComments = await AppContext.StoreService.GetPluginComments(this.Model.Id);

            if (pluginComments == null)
                return;

            if (this.Comments.Any())
                this.Comments.Clear();

            foreach (PluginComment comment in pluginComments)
                this.Comments.Add(comment);
        }

        #endregion

        #region ACTIONS

        private async void OnCommentAction(object param)
        {
            var commentDialog = new AddComment(this.model.Id);

            await commentDialog.ShowAsync();

            this.LoadPluginComments();
        }

        #endregion

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public override void Refresh(object parameter)
        {
            this.Model = parameter as PluginModel;
            this.LoadPluginComments();
        }
    }
}
