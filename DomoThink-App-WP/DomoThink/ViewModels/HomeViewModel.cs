using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DomoThink.MVVM;
using System.Windows.Input;
using Windows.UI.Xaml.Controls;

/*--------------------------------------------------------
 * HomeViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 17/10/2015 23:27:24
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels
{
    public class HomeViewModel : ViewModelBase
    {
        #region FIELDS

        private INavigate navigation;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets the objects command.
        /// </summary>
        public ICommand ObjectsCommand { get; private set; }

        /// <summary>
        /// Gets the directives command.
        /// </summary>
        public ICommand DirectivesCommand { get; private set; }

        /// <summary>
        /// Gets the DomoBox command.
        /// </summary>
        public ICommand DomoBoxCommand { get; private set; }

        /// <summary>
        /// Gets the parameters command.
        /// </summary>
        public ICommand ParametersCommand { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new HomeViewModel instance.
        /// </summary>
        /// <param name="navigation">Current navigation frame</param>
        public HomeViewModel(INavigate navigation)
        {
            // Initialize navigation service
            this.navigation = navigation;

            // Initialize commands
            this.ObjectsCommand = new RelayCommand(this.ObjectsCommandAction);
            this.DirectivesCommand = new RelayCommand(this.DirectivesCommandAction);
            this.DomoBoxCommand = new RelayCommand(this.DomoBoxCommandAction);
            this.ParametersCommand = new RelayCommand(this.ParametersCommandAction);
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Executes the command action when the objects button has been clicked.
        /// </summary>
        /// <param name="param"></param>
        private void ObjectsCommandAction(Object param)
        {
            this.navigation.Navigate(typeof(Pages.Objects.Objects));
        }

        /// <summary>
        /// Executes the command action when the directives button has been clicked.
        /// </summary>
        /// <param name="param"></param>
        private void DirectivesCommandAction(Object param)
        {
            this.navigation.Navigate(typeof(Pages.Directives.Directives));
        }

        /// <summary>
        /// Executes the command action when the DomoBox button has been clicked.
        /// </summary>
        /// <param name="param"></param>
        private void DomoBoxCommandAction(Object param)
        {
            this.navigation.Navigate(typeof(Pages.Box.Box));
        }

        /// <summary>
        /// Executes the command action when the parameters button has been clicked.
        /// </summary>
        /// <param name="param"></param>
        private void ParametersCommandAction(Object param)
        {
            this.navigation.Navigate(typeof(Pages.Parameters));
        }

        #endregion

        #region METHODS
        #endregion
    }
}
