using DAL.Model;
using DomoThink.API;
using DomoThink.MVVM;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

/*--------------------------------------------------------
 * DirectivesEditorViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 10/09/2016 21:30:13
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Directives
{
    public class DirectiveEditorViewModel : ViewModelBase
    {
        #region FIELDS

        private DirectiveModel directiveModel;
        private EditorMode mode;

        private ObjectService objectService;
        private DirectiveService directiveService;

        #endregion

        #region PROPERTIES

        public DirectiveModel DirectiveInformations
        {
            get { return this.directiveModel; }
            set { this.NotifyPropertyChanged(ref this.directiveModel, value); }
        }

        public EditorMode Mode
        {
            get { return this.mode; }
            set { this.NotifyPropertyChanged(ref this.mode, value); }
        }

        public ObservableCollection<ObjectModel> ObjectList { get; set; }

        public ICommand AddDirectiveCommand { get; private set; }

        public ICommand EditDirectiveCommand { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new DirectiveEditor view model instance.
        /// </summary>
        public DirectiveEditorViewModel()
        {
            // Initialize API services
            this.objectService = new ObjectService(App.ApiClient);
            this.directiveService = new DirectiveService(App.ApiClient);

            // Initialize properties
            this.ObjectList = new ObservableCollection<ObjectModel>();
            this.directiveModel = new DirectiveModel(-1, null, -1, -1, -1);
            this.mode = EditorMode.Create;

            // Initialize the commands
            this.AddDirectiveCommand = new Command(this.AddDirectiveAction);
            this.EditDirectiveCommand = new Command(this.EditDirectiveAction);

            // Load the objects
            //var objList = this.objectService.GetObjects().Result;

            //if (objList != null)
            //    foreach (ObjectModel obj in objList)
            //        this.ObjectList.Add(obj);
        }

        #endregion

        #region METHODS



        #endregion

        #region ACTIONS

        private async void AddDirectiveAction(Object param)
        {
        }

        private async void EditDirectiveAction(Object param)
        {
        }

        #endregion
    }
}
