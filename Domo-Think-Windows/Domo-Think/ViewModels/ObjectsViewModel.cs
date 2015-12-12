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

        #endregion

        #region PROPERTIES

        public ICommand AddObjectCommand { get; private set; }

        public ICommand GetObjectPropertiesCommand { get; private set; }

        public ICommand SwitchObjectStateCommand { get; private set; }

        public ObservableCollection<ObjectModel> ConnectedObjects { get; private set; }

        #endregion

        #region CONSTRUCTORS

        public ObjectsViewModel()
        {
            // Initialiaze the commands
            this.AddObjectCommand = new Command(this.AddObjectCommandAction);
            this.GetObjectPropertiesCommand = new Command(this.GetObjectPropertiesCommandAction);
            this.SwitchObjectStateCommand = new Command(this.SwitchObjectStateCommandAction);

            // Initialize connected objets collection
            this.ConnectedObjects = new ObservableCollection<ObjectModel>();
            for (Int32 i = 0; i < 5; ++i)
            {
                this.ConnectedObjects.Add(new ObjectModel()
                {
                    Name = "Object #" + i.ToString(),
                    State = i % 2 == 0
                });
            }
        }

        #endregion

        #region METHODS



        #endregion

        #region ACTIONS

        private void AddObjectCommandAction(Object param)
        {
            NavigationService.Navigate(typeof(Views.Objects.AddObject));
        }

        private void GetObjectPropertiesCommandAction(Object param)
        {
        }

        private void SwitchObjectStateCommandAction(Object param)
        {
        }

        #endregion
    }
}
