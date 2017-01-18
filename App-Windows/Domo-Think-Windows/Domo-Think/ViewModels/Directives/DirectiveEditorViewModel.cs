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
        private int selectedActionId;
        private int selectedDeviceIndex;
        private int selectedDayIndex;
        private int selectedPeriodicityType;
        private DateTime selectedTime;
        private bool hasError;
        private string errorMessage;
        private DirectiveModel directiveModel;
        private EditorMode mode;

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

        public int SelectedActionIndex
        {
            get { return this.selectedActionId; }
            set { this.NotifyPropertyChanged(ref this.selectedActionId, value); }
        }

        public int SelectedDeviceIndex
        {
            get { return this.selectedDeviceIndex; }
            set { this.NotifyPropertyChanged(ref this.selectedDeviceIndex, value); }
        }

        public int SelectedDayIndex
        {
            get { return this.selectedDayIndex; }
            set { this.NotifyPropertyChanged(ref this.selectedDayIndex, value); }
        }

        public int SelectedPeriodicityType
        {
            get { return this.selectedPeriodicityType; }
            set { this.NotifyPropertyChanged(ref this.selectedPeriodicityType, value); }
        }

        public DateTime SelectedTime
        {
            get { return this.selectedTime; }
            set { this.NotifyPropertyChanged(ref this.selectedTime, value); }
        }

        public string ErrorMessage
        {
            get { return this.errorMessage; }
            set { this.NotifyPropertyChanged(ref this.errorMessage, value); }
        }

        public bool HasError
        {
            get { return this.hasError; }
            set { this.NotifyPropertyChanged(ref this.hasError, value); }
        }

        public ObservableCollection<DeviceModel> DeviceList { get; set; }

        public ICommand AddDirectiveCommand { get; private set; }

        public ICommand EditDirectiveCommand { get; private set; }
        
        
        /// <summary>
        /// Creates a new DirectiveEditor view model instance.
        /// </summary>
        public DirectiveEditorViewModel(EditorMode mode)
        {
            // Initialize properties
            this.DeviceList = new ObservableCollection<DeviceModel>();
            this.directiveModel = new DirectiveModel(0, null, -1, -1, -1, -1);
            this.Mode = mode;
            this.SelectedActionIndex = 0;
            this.SelectedDeviceIndex = -1;
            this.SelectedDayIndex = -1;
            this.selectedTime = DateTime.Now;
            this.HasError = false;
            this.ErrorMessage = string.Empty;

            // Initialize the commands
            this.AddDirectiveCommand = new Command(this.AddDirectiveAction);
            this.EditDirectiveCommand = new Command(this.EditDirectiveAction);
        }
        
        private async void AddDirectiveAction(object param)
        {
            //this.DirectiveInformations.Id = 0;
            this.DirectiveInformations.ActionId = this.SelectedActionIndex;
            this.DirectiveInformations.CreatorId = App.UserId;
            this.DirectiveInformations.ObjectId = this.DeviceList[this.selectedDeviceIndex].Id;
            this.DirectiveInformations.PeriodicityType = this.SelectedPeriodicityType + 1;

            int day = this.SelectedDayIndex + 1;
            string hour = this.SelectedTime.Hour.ToString("D2") + ":" + this.SelectedTime.Minute.ToString("D2");
            
            string periodicityData = Newtonsoft.Json.JsonConvert.SerializeObject(new PeriodicityModel(day, hour));

            this.DirectiveInformations.PeriodicityData = periodicityData;

            await AppContext.DirectiveService.AddDirective(this.DirectiveInformations);

            this.Pop();
        }

        private async void EditDirectiveAction(object param)
        {
            this.DirectiveInformations.ActionId = this.SelectedActionIndex;
            this.DirectiveInformations.CreatorId = App.UserId;
            this.DirectiveInformations.ObjectId = this.DeviceList[this.selectedDeviceIndex].Id;
            this.DirectiveInformations.PeriodicityType = this.SelectedPeriodicityType + 1;

            int day = this.SelectedDayIndex + 1;
            string hour = this.SelectedTime.Hour + ":" + this.SelectedTime.Minute;
            string periodicityData = Newtonsoft.Json.JsonConvert.SerializeObject(new PeriodicityModel(day, hour));

            this.DirectiveInformations.PeriodicityData = periodicityData;

            await AppContext.DirectiveService.UpdateDirective(this.DirectiveInformations);

            this.Pop();
        }
        
        /// <summary>
        /// Refresh the ViewModel data.
        /// </summary>
        /// <param name="parameter"></param>
        public async override void Refresh(Object parameter)
        {
            var devices = await AppContext.DeviceService.GetDevices();

            foreach (var device in devices)
                this.DeviceList.Add(device);

            if (parameter != null)
            {
                this.DirectiveInformations = parameter as DirectiveModel;

                this.SelectedActionIndex = this.DirectiveInformations.ActionId;
                this.SelectedDeviceIndex = this.GetIndexOfDevice(this.DirectiveInformations.ObjectId);
                this.SelectedPeriodicityType = this.DirectiveInformations.PeriodicityType - 1;

                if (string.IsNullOrEmpty(this.DirectiveInformations.PeriodicityData))
                    return;

                dynamic periodicityData = Newtonsoft.Json.Linq.JObject.Parse(this.DirectiveInformations.PeriodicityData);

                this.SelectedDayIndex = (int)(periodicityData.day) - 1;

                string date = periodicityData.hour;
                string[] hourMin = date.Split(':');
                this.SelectedTime = new DateTime(1, 1, 1, int.Parse(hourMin[0]), int.Parse(hourMin[1]), 0);
            }
        }

        private int GetIndexOfDevice(int id)
        {
            for (int i = 0; i < this.DeviceList.Count; ++i)
                if (this.DeviceList[i].Id == id)
                    return i;

            return -1;
        }
    }
}
