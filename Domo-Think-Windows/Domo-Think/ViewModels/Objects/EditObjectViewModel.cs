﻿using DAL.Model;
using DomoThink.API;
using DomoThink.MVVM;
using System;
using System.Windows.Input;

/*--------------------------------------------------------
 * EditObjectViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 10/09/2016 18:08:15
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Objects
{
    public class EditObjectViewModel : ViewModelBase
    {
        #region FIELDS

        private DeviceModel deviceInformations;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets or sets the Object informations.
        /// </summary>
        public DeviceModel ObjectInformations
        {
            get { return this.deviceInformations; }
            set { this.NotifyPropertyChanged(ref this.deviceInformations, value); }
        }

        /// <summary>
        /// Gets the edit object command.
        /// </summary>
        public ICommand EditObjectCommand { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new EditObjectViewModel instance.
        /// </summary>
        public EditObjectViewModel()
        {
            // Initialize the commands
            this.EditObjectCommand = new Command(this.EditObjectAction);
        }

        #endregion

        #region METHODS



        #endregion

        #region ACTIONS

        private async void EditObjectAction(Object param)
        {
            try
            {
                Boolean result = await AppContext.DeviceService.UpdateDevice(this.ObjectInformations);

                if (result)
                {
                }
                else
                {
                }

                this.Pop();
            }
            catch
            {
            }
        }

        #endregion

        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public override void Refresh(Object parameter)
        {
            if (parameter != null && parameter is DeviceModel)
                this.ObjectInformations = parameter as DeviceModel;
        }
    }
}
