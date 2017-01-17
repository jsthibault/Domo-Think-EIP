using DomoThink.Navigation;
using DomoThink.Services;
using DomoThink.ViewModels;
using DomoThink.ViewModels.Accounts;
using DomoThink.ViewModels.Box;
using DomoThink.ViewModels.Directives;
using DomoThink.ViewModels.Objects;
using DomoThink.ViewModels.Plugins;
using DomoThink.ViewModels.Store;
using DomoThink.Views;
using DomoThink.Views.Account;
using DomoThink.Views.Box;
using DomoThink.Views.Directives;
using DomoThink.Views.Devices;
using DomoThink.Views.Plugins;
using DomoThink.Views.Store;
using System;
using Windows.ApplicationModel;
using Windows.ApplicationModel.Activation;
using Windows.ApplicationModel.Core;
using Windows.UI;
using Windows.UI.Core;
using Windows.UI.ViewManagement;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;

namespace DomoThink
{
    /// <summary>
    /// Fournit un comportement spécifique à l'application afin de compléter la classe Application par défaut.
    /// </summary>
    sealed partial class App : Application
    {
        public static DAL.API.ApiClient ApiClient;
        public static string LoginToken;
        public static int UserId;

        /// <summary>
        /// Initialise l'objet d'application de singleton.  Il s'agit de la première ligne du code créé
        /// à être exécutée. Elle correspond donc à l'équivalent logique de main() ou WinMain().
        /// </summary>
        public App()
        {
            Microsoft.ApplicationInsights.WindowsAppInitializer.InitializeAsync(
                Microsoft.ApplicationInsights.WindowsCollectors.Metadata |
                Microsoft.ApplicationInsights.WindowsCollectors.Session);
            this.InitializeComponent();
            this.Suspending += OnSuspending;
            ApiClient = new DAL.API.ApiClient(API.APIConstants.API_URL_FILIPE_PI);
            ApiClient.IsActive = true;
        }

        /// <summary>
        /// Invoqué lorsque l'application est lancée normalement par l'utilisateur final.  D'autres points d'entrée
        /// seront utilisés par exemple au moment du lancement de l'application pour l'ouverture d'un fichier spécifique.
        /// </summary>
        /// <param name="e">Détails concernant la requête et le processus de lancement.</param>
        protected override void OnLaunched(LaunchActivatedEventArgs e)
        {

#if DEBUG
            if (System.Diagnostics.Debugger.IsAttached)
                this.DebugSettings.EnableFrameRateCounter = false;
#endif

            Frame rootFrame = Window.Current.Content as Frame;

            // Ne répétez pas l'initialisation de l'application lorsque la fenêtre comporte déjà du contenu,
            // assurez-vous juste que la fenêtre est active
            if (rootFrame == null)
            {
                // Créez un Frame utilisable comme contexte de navigation et naviguez jusqu'à la première page
                rootFrame = new Frame();

                rootFrame.NavigationFailed += OnNavigationFailed;

                if (e.PreviousExecutionState == ApplicationExecutionState.Terminated)
                {
                    //TODO: chargez l'état de l'application précédemment suspendue
                }

                SystemNavigationManager.GetForCurrentView().BackRequested += App_BackRequested;

                // Placez le frame dans la fenêtre active
                Window.Current.Content = rootFrame;
            }

            //Frame frame = Window.Current.Content as Frame;

            //Window.Current.Content = new AppShell(frame);
            //NavigationService.InitializeContentFrame(frame);
            //NavigationService.Navigate(typeof(Views.MainPage));
            //Window.Current.Activate();
            //frame.BackStack.Clear();

            this.HideTitleBar();
            this.InitializeViewFactory();

            if (rootFrame.Content == null)
                rootFrame.Navigate(typeof(Views.Login.LoginPage), e.Arguments);

            // Vérifiez que la fenêtre actuelle est active
            Window.Current.Activate();
        }

        private void App_BackRequested(Object sender, BackRequestedEventArgs e)
        {
            if (NavigationService.CanGoBack())
            {
                e.Handled = true;
                NavigationService.GetCurrentViewModel().Pop();
            }
        }

        /// <summary>
        /// Appelé lorsque la navigation vers une page donnée échoue
        /// </summary>
        /// <param name="sender">Frame à l'origine de l'échec de navigation.</param>
        /// <param name="e">Détails relatifs à l'échec de navigation</param>
        void OnNavigationFailed(object sender, NavigationFailedEventArgs e)
        {
            throw new Exception("Failed to load Page " + e.SourcePageType.FullName);
        }

        /// <summary>
        /// Appelé lorsque l'exécution de l'application est suspendue.  L'état de l'application est enregistré
        /// sans savoir si l'application pourra se fermer ou reprendre sans endommager
        /// le contenu de la mémoire.
        /// </summary>
        /// <param name="sender">Source de la requête de suspension.</param>
        /// <param name="e">Détails de la requête de suspension.</param>
        private void OnSuspending(object sender, SuspendingEventArgs e)
        {
            var deferral = e.SuspendingOperation.GetDeferral();
            //TODO: enregistrez l'état de l'application et arrêtez toute activité en arrière-plan
            deferral.Complete();
        }

        private void HideTitleBar()
        {
            ApplicationViewTitleBar formattableTitleBar = ApplicationView.GetForCurrentView().TitleBar;
            formattableTitleBar.ButtonBackgroundColor = Colors.Transparent;
            CoreApplicationViewTitleBar coreTitleBar = CoreApplication.GetCurrentView().TitleBar;
            coreTitleBar.ExtendViewIntoTitleBar = true;
        }

        public static void ShowTitleBar()
        {
            ApplicationViewTitleBar formattableTitleBar = ApplicationView.GetForCurrentView().TitleBar;
            formattableTitleBar.ButtonBackgroundColor = null;
            CoreApplicationViewTitleBar coreTitleBar = CoreApplication.GetCurrentView().TitleBar;
            coreTitleBar.ExtendViewIntoTitleBar = false;
        }

        private void InitializeViewFactory()
        {
            // Initialize the ViewFactory
            ViewFactory.Register<MainViewModel, MainPage>();
            ViewFactory.Register<SettingsViewModel, SettingsPage>();
            ViewFactory.Register<ObjectsViewModel, DevicesPage>();
            ViewFactory.Register<AddObjectViewModel, AddDevicePage>();
            ViewFactory.Register<EditObjectViewModel, EditDevicePage>();
            // TODO: add directives
            ViewFactory.Register<DirectiveViewModel, DirectivesPage>();
            ViewFactory.Register<DirectiveEditorViewModel, DirectiveEditor>();
            ViewFactory.Register<DomoBoxViewModel, DomoBoxPage>();
            ViewFactory.Register<AccountsViewModel, AccountsPage>();
            ViewFactory.Register<AddEditAccountViewModel, AccountEditorPage>();
            ViewFactory.Register<ChangePasswordViewModel, ChangePasswordPage>();
            ViewFactory.Register<DeleteAccountViewModel, DeleteAccountPage>();
            // TODO: add plugins
            ViewFactory.Register<PluginsViewModel, Plugins>();
            // TODO: add store
            ViewFactory.Register<StoreViewModel, StorePage>();
            ViewFactory.Register<PluginViewModel, PluginPage>();
        }
    }
}
