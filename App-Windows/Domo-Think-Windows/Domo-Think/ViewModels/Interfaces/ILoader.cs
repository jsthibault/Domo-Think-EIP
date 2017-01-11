using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

/*--------------------------------------------------------
 * ILoader.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 22/04/2016 12:41:56
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.ViewModels.Interfaces
{
    public interface ILoader
    {
        Boolean Loading { get; set; }

        Boolean Display { get; set; }

        ICommand LoadCommand { get; set; }
    }
}
