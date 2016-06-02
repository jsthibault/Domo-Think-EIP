using DomoAPI.Model;
using DomoThink.API;
using DomoThink.MVVM;
using DomoThink.ViewModels.Interfaces;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

/*--------------------------------------------------------
 * AccountsViewModel.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 02/06/2016 14:03:24
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels
{
    public class AccountsViewModel : ViewModelBase, ILoader
    {
        #region CONSTANTS



        #endregion

        #region ENUMS



        #endregion

        #region FIELDS

        private Boolean loading;
        private Boolean display;

        private AccountService service;

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
        /// Gets or sets the add account command.
        /// </summary>
        public ICommand AddAccountCommand { get; set; }

        /// <summary>
        /// Gets or sets the delete account command.
        /// </summary>
        public ICommand DeleteAccountCommand { get; set; }

        /// <summary>
        /// Gets or sets the account collection.
        /// </summary>
        public ObservableCollection<AccountModel> Accounts { get; set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new AccountsViewModel instance.
        /// </summary>
        public AccountsViewModel()
        {
            // Initialize the commands
            this.LoadCommand = new Command(this.LoadAccountsAction);
            this.AddAccountCommand = new Command(this.AddAccountAction);
            this.DeleteAccountCommand = new Command(this.DeleteAccountAction);

            // Initialize the collection
            this.Accounts = new ObservableCollection<AccountModel>();

            // Initialize the api service
            this.service = new AccountService(App.ApiClient);
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
        /// Loads the accounts.
        /// </summary>
        /// <param name="param"></param>
        private async void LoadAccountsAction(Object param)
        {
            this.LoadingState(true);

            if (this.Accounts.Any())
                this.Accounts.Clear();

            List<AccountModel> _accounts = await this.service.GetAccounts();

            if (_accounts != null)
            {
                foreach (AccountModel account in _accounts)
                    this.Accounts.Add(account);
            }

            this.LoadingState(false);
        }

        /// <summary>
        /// Add a new account.
        /// </summary>
        /// <param name="param"></param>
        private void AddAccountAction(Object param)
        {
        }

        /// <summary>
        /// Ask the user if he want to delete the selected account.
        /// </summary>
        /// <param name="param"></param>
        private void DeleteAccountAction(Object param)
        {
        }

        #endregion
    }
}
