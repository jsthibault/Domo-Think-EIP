using Domo_Think.Model;
using Domo_Think.MVVM;
using Domo_Think.Navigation;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Windows.UI.Xaml.Controls;


/*--------------------------------------------------------
 * ObjectsViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 11/12/2015 15:56:28
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.ViewModels
{
    public class ObjectsViewModel : ViewModelBase
    {
        #region CONSTANTS



        #endregion

        #region ENUMS



        #endregion

        #region FIELDS

        private Boolean loadingObjects;
        private Boolean displayObjects;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the loading visibility state.
        /// </summary>
        public Boolean LoadingObjects
        {
            get { return this.loadingObjects; }
            set { this.NotifyPropertyChanged(ref this.loadingObjects, value); }
        }

        /// <summary>
        /// Gets or sets the display objects visibility state.
        /// </summary>
        public Boolean DisplayObjects
        {
            get { return this.displayObjects; }
            set { this.NotifyPropertyChanged(ref this.displayObjects, value); }
        }

        /// <summary>
        /// Gets the Add object command.
        /// </summary>
        public ICommand AddObjectCommand { get; private set; }

        /// <summary>
        /// Gets the load/reload object command.
        /// </summary>
        public ICommand LoadObjectsCommand { get; private set; }

        /// <summary>
        /// Gets the switch state command of an object.
        /// </summary>
        public ICommand SwitchObjectStateCommand { get; private set; }

        /// <summary>
        /// Gets the connected objects list.
        /// </summary>
        public ObservableCollection<ObjectModel> ConnectedObjects { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Create a new Objects View Model instance.
        /// </summary>
        public ObjectsViewModel()
        {
            // Initialiaze the commands
            this.AddObjectCommand = new Command(this.AddObjectCommandAction);
            this.LoadObjectsCommand = new Command(this.LoadObjectsCommandAction);
            this.SwitchObjectStateCommand = new Command(this.SwitchObjectStateCommandAction);

            // Initialize connected objets collection
            this.ConnectedObjects = new ObservableCollection<ObjectModel>();

            // Initialize different view states
            this.LoadingObjects = true;
            this.DisplayObjects = !this.LoadingObjects;
        }

        #endregion

        #region METHODS



        #endregion

        #region ACTIONS

        /// <summary>
        /// Switch to the page to add a new object.
        /// </summary>
        /// <param name="param"></param>
        private void AddObjectCommandAction(Object param)
        {
            NavigationService.Navigate(typeof(Views.Objects.AddObject));
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="param"></param>
        private void SwitchObjectStateCommandAction(Object param)
        {
            // Change object state here
        }

        /// <summary>
        /// Loads or reloads the object list.
        /// </summary>
        /// <param name="param"></param>
        private async void LoadObjectsCommandAction(Object param)
        {
            this.LoadingObjects = true;
            this.DisplayObjects = false;

            await Task.Delay(4000); // Wait 4 seconds

            // Fill list with the data we recieve from the box
            if (this.ConnectedObjects.Any())
                this.ConnectedObjects.Clear();

            for (Int32 i = 0; i < 5; ++i)
            {
                this.ConnectedObjects.Add(new ObjectModel()
                {
                    Name = "Object #" + i.ToString(),
                    State = i % 2 == 0
                });
            }
            
            this.LoadingObjects = false;
            this.DisplayObjects = true;

        }

        #endregion
    }
}
