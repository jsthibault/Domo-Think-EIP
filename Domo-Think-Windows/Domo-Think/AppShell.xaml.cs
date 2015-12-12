using Domo_Think.Model;
using Domo_Think.MVVM;
using Domo_Think.Navigation;
using Domo_Think.Views;
using Domo_Think.Views.Objects;
using System;
using System.Collections.Generic;
using System.Windows.Input;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Media.Animation;

namespace Domo_Think
{
    public sealed partial class AppShell : Page
    {
        #region CONSTANTS

        private readonly Type MainViewType = typeof(Views.MainPage);

        #endregion

        #region FIELDS

        private Frame contentFrame;
        private NavigationButton currentNavigationButton;

        #endregion

        #region PROPERTIES

        /// <summary>
        /// Gets the navigation command action.
        /// </summary>
        public ICommand NavigationCommand { get; private set; }

        /// <summary>
        /// Gets the menu command action.
        /// </summary>
        public ICommand MenuCommand { get; private set; }

        /// <summary>
        /// Gets the back command action.
        /// </summary>
        public ICommand BackCommand { get; private set; }

        /// <summary>
        /// Gets the list of the primary navigation buttons.
        /// </summary>
        public List<NavigationButton> PrimaryNavigationButtons { get; private set; }

        /// <summary>
        /// Gets the list of the secondary navigation buttons.
        /// </summary>
        public List<NavigationButton> SecondaryNavigationButtons { get; private set; }

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new app shell.
        /// </summary>
        /// <param name="frame">Current root frame</param>
        public AppShell(Frame frame)
        {
            this.InitializeComponent();
            this.DataContext = this;
            
            // Initialize the commands
            this.NavigationCommand = new Command(this.NavigateAction);
            this.MenuCommand = new Command(this.MenuAction);
            this.BackCommand = new Command(this.GoBackAction);

            // Initialize the content frame and navigation buttons
            this.InitializeFrame(frame);
            this.InitializeNavigationButtons();
            this.Loaded += (sender, e) => this.UpdateShell();
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Initialize the content frame.
        /// </summary>
        /// <param name="frame"></param>
        private void InitializeFrame(Frame frame)
        {
            this.contentFrame = frame;
            this.contentFrame.Navigated += (sender, e) => this.UpdateShell();
            this.contentFrame.ContentTransitions = new TransitionCollection();
            this.contentFrame.ContentTransitions.Add(new NavigationThemeTransition()
            {
                DefaultNavigationTransitionInfo = new EntranceNavigationTransitionInfo()
            });

            this.ShellSplitView.Content = this.contentFrame;
        }

        /// <summary>
        /// Initialize the navigation buttons.
        /// </summary>
        private void InitializeNavigationButtons()
        {
            // Initialize primary buttons
            this.PrimaryNavigationButtons = new List<NavigationButton>();
            this.PrimaryNavigationButtons.Add(new NavigationButton("Home", "\uE80F", typeof(MainPage), true));
            this.PrimaryNavigationButtons.Add(new NavigationButton("Objects", "\uE772", typeof(ObjectsPage)));
            this.PrimaryNavigationButtons.Add(new NavigationButton("Directives", "\uE17D", typeof(OrdersPage)));
            this.PrimaryNavigationButtons.Add(new NavigationButton("Store", "\uE719", typeof(StorePage)));

            // Initialize secondary buttons
            this.SecondaryNavigationButtons = new List<NavigationButton>();
            this.SecondaryNavigationButtons.Add(new NavigationButton("Settings", "\uE713", typeof(SettingsPage)));
        }

        /// <summary>
        /// Update the shell when a change occurs.
        /// </summary>
        private void UpdateShell()
        {
            if (this.ActualWidth < 900)
                this.ShellSplitView.IsPaneOpen = false;

            // TODO: Check platform (adaptative code)
            this.BackButton.Visibility = this.contentFrame.CanGoBack ? Visibility.Visible : Visibility.Collapsed;

            if (this.IsCurrentFrameInMenu())
            {
                this.UpdateCurrentRadioButton(this.PRIMARY_ITEMS);
                this.UpdateCurrentRadioButton(this.SECONDARY_ITEMS);
            }
        }

        /// <summary>
        /// Update the current radio button selected state.
        /// </summary>
        /// <param name="dp"></param>
        private void UpdateCurrentRadioButton(DependencyObject dp)
        {
            Type _type = this.contentFrame.CurrentSourcePageType;

            foreach (RadioButton radioButton in GetAllRadioButtons(dp))
            {
                NavigationButton _target = radioButton.CommandParameter as NavigationButton;

                if (_target == null)
                    continue;

                radioButton.IsChecked = _target.Type.Equals(_type);

                if (radioButton.IsChecked.Value)
                    this.currentNavigationButton = _target;
            }
        }

        /// <summary>
        /// Get all radio buttons from a dependency object.
        /// </summary>
        /// <param name="parent"></param>
        /// <returns></returns>
        private List<RadioButton> GetAllRadioButtons(DependencyObject parent)
        {
            var list = new List<RadioButton>();
            for (int i = 0; i < VisualTreeHelper.GetChildrenCount(parent); i++)
            {
                var child = VisualTreeHelper.GetChild(parent, i);
                if (child is RadioButton)
                {
                    list.Add(child as RadioButton);
                    continue;
                }
                list.AddRange(GetAllRadioButtons(child));
            }
            return list;
        }

        /// <summary>
        /// Check if the current frame type is in the menu.
        /// </summary>
        /// <returns></returns>
        private Boolean IsCurrentFrameInMenu()
        {
            Type _type = this.contentFrame.CurrentSourcePageType;

            return this.PrimaryNavigationButtons.Find(x => x.Type == _type) != null ||
                this.SecondaryNavigationButtons.Find(x => x.Type == _type) != null;
        }

        #endregion

        #region EVENTS
    
        /// <summary>
        /// Do not check the radio button.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void DontCheck(Object sender, RoutedEventArgs e)
        {
            if (sender is RadioButton)
                (sender as RadioButton).IsChecked = false;
        }

        #endregion

        #region ACTIONS

        /// <summary>
        /// Process the navigate action.
        /// </summary>
        /// <param name="param"></param>
        private void NavigateAction(Object param)
        {
            NavigationButton _navigationButton = param as NavigationButton;

            if (this.currentNavigationButton != null && this.currentNavigationButton.Type != _navigationButton.Type)
                NavigationService.Navigate(_navigationButton.Type);

            this.currentNavigationButton = _navigationButton;
        }

        /// <summary>
        /// Process the Go back action.
        /// </summary>
        /// <param name="param"></param>
        private void GoBackAction(Object param)
        {
            NavigationService.GoBack();
        }

        /// <summary>
        /// Process the open and close menu action.
        /// </summary>
        /// <param name="param"></param>
        private void MenuAction(Object param)
        {
            this.ShellSplitView.IsPaneOpen = !this.ShellSplitView.IsPaneOpen;
        }

        #endregion
    }
}
