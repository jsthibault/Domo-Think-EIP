using System;
using System.Diagnostics;
using System.Windows.Input;

/*--------------------------------------------------------
 * Command.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 10/12/2015 21:04:04
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.MVVM
{
    public class Command : ICommand
    {
        private readonly Action<Object> commandAction;
        private readonly Func<Boolean> canExecuteAction;
        public event EventHandler CanExecuteChanged;

        public Command(Action<Object> action)
            : this(action, () => true)
        { }

        public Command(Action<Object> action, Func<Boolean> canExecute)
        {
            if (action == null)
                throw new ArgumentNullException("You must give a valid action to the Command.");

            this.commandAction = action;
            this.canExecuteAction = canExecute;
        }

        public void Execute(Object parameter)
        {
            if (this.canExecuteAction())
                this.commandAction(parameter);
        }

        [DebuggerStepThrough]
        public Boolean CanExecute(Object parameter)
        {
            try
            {
                return this.canExecuteAction == null ? true : this.canExecuteAction();
            }
            catch
            {
                Debugger.Break();
                return false;
            }
        }
    }
}
