using DomoThink.Models;
using DomoThink.MVVM;
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
 * Created: 27/10/2015 10:56:00
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels
{
    public class ObjectsViewModel : ViewModelBase
    {
        #region CONSTANTS



        #endregion

        #region ENUMS



        #endregion

        #region FIELDS

        private ObservableCollection<ObjectModel> objects;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the list of the objects from the DomoBox.
        /// </summary>
        public ObservableCollection<ObjectModel> Objects
        {
            get { return this.objects; }
            set { this.NotifyPropertyChanged(ref this.objects, value); }
        }

        /// <summary>
        /// Gets the add object command.
        /// </summary>
        public ICommand AddObjectCommand { get; private set; }

        #endregion

        #region CONSTRUCTORS

        public ObjectsViewModel()
        {
            this.Objects = new ObservableCollection<ObjectModel>();
            this.Objects.Add(new ObjectModel("Test1", true));
            this.Objects.Add(new ObjectModel("Test2", false));

            // Initialize commands
            this.AddObjectCommand = new RelayCommand(this.AddObjectCommandAction);
        }

        #endregion

        #region METHODS

        private void AddObjectCommandAction(Object param)
        {
        }

        #endregion
    }
}
