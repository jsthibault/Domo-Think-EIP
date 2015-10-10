using System;
using System.Windows.Input;

namespace DomoThink.MVVM
{
    public class RelayCommand : ICommand
    {
        #region FIELDS

        private readonly Action<object> _execute;
        private readonly Predicate<object> _canExecute;

        #endregion

        #region PROPERTIES

        public event EventHandler CanExecuteChanged;

        #endregion

        #region CONSTRUCTORS

        /// <summary>
        /// Creates a new RelayCommand.
        /// </summary>
        /// <param name="execute"></param>
        public RelayCommand(Action<object> execute)
            : this(execute, null)
        {
        }

        /// <summary>
        /// Creates a new RelayCommand.
        /// </summary>
        /// <param name="execute"></param>
        /// <param name="canExecute"></param>
        public RelayCommand(Action<object> execute, Predicate<object> canExecute)
        {
            if (execute == null)
                throw new ArgumentNullException("execute");
            _execute = execute;
            _canExecute = canExecute;
        }

        #endregion

        #region METHODS

        /// <summary>
        /// Determines if the command can be executed.
        /// </summary>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public bool CanExecute(Object parameter)
        {
            return _canExecute == null ? true : _canExecute(parameter);
        }

        /// <summary>
        /// Execute the command action.
        /// </summary>
        /// <param name="parameter"></param>
        public void Execute(Object parameter)
        {
            _execute(parameter);
        }

        public void RaiseCanExecuteChanged()
        {
            var handler = CanExecuteChanged;
            if (handler != null)
            {
                handler(this, EventArgs.Empty);
            }
        }

        #endregion
    }
}
