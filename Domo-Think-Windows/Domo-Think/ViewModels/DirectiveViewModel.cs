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
        #region CONSTANTS



        #endregion

        #region ENUMS



        #endregion

        #region FIELDS

        private Boolean loadingOrders;
        private Boolean displayOrders;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the loading visibility state.
        /// </summary>
        public Boolean LoadingOrders
        {
            get { return this.loadingOrders; }
            set { this.NotifyPropertyChanged(ref this.loadingOrders, value); }
        }

        /// <summary>
        /// Gets or sets the display objects visibility state.
        /// </summary>
        public Boolean DisplayOrders
        {
            get { return this.displayOrders; }
            set { this.NotifyPropertyChanged(ref this.displayOrders, value); }
        }

        /// <summary>
        /// Gets the Add object command.
        /// </summary>
        public ICommand AddOrderCommand { get; private set; }

        /// <summary>
        /// Gets the load/reload object command.
        /// </summary>
        public ICommand LoadOrdersCommand { get; private set; }

        /// <summary>
        /// Gets the connected objects list.
        /// </summary>
        public ObservableCollection<ObjectModel> ConnectedObjects { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Create a new Objects View Model instance.
        /// </summary>
        public DirectiveViewModel()
        {
            // Initialiaze the commands
            this.AddOrderCommand = new Command(this.AddObjectCommandAction);
            this.LoadOrdersCommand = new Command(this.LoadObjectsCommandAction);

            // Initialize connected objets collection
            this.ConnectedObjects = new ObservableCollection<ObjectModel>();

            // Initialize different view states
            this.LoadingOrders = true;
            this.DisplayOrders = !this.LoadingOrders;
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
            //NavigationService.Navigate(typeof(Views.Objects.AddObject));
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
            this.LoadingOrders = true;
            this.DisplayOrders = false;

            await Task.Delay(4000); // Wait 4 seconds

            // Fill list with the data we recieve from the box
            if (this.ConnectedObjects.Any())
                this.ConnectedObjects.Clear();

            for (Int32 i = 0; i < 5; ++i)
            {
                this.ConnectedObjects.Add(new ObjectModel()
                {
                    Name = "Directive #" + i.ToString(),
                    State = i % 2 == 0
                });
            }

            this.LoadingOrders = false;
            this.DisplayOrders = true;
        }

        #endregion
    }
}
