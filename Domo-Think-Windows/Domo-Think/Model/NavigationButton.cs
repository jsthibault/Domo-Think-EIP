using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


/*--------------------------------------------------------
 * NavigationButton.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 10/12/2015 21:00:15
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace Domo_Think.Model
{
    public class NavigationButton
    {
        /// <summary>
        /// Gets or sets the icon.
        /// </summary>
        public String Icon { get; set; }

        /// <summary>
        /// Gets or sets the destination page type.
        /// </summary>
        public Type Type { get; set; }

        /// <summary>
        /// Gets or sets the display text.
        /// </summary>
        public String Text { get; set; }

        /// <summary>
        /// Gets or sets the current button state.
        /// </summary>
        public Boolean IsChecked { get; set; }

        /// <summary>
        /// Creates a new Navigation button.
        /// </summary>
        public NavigationButton()
            : this("NULL", "NULL", null, false)
        { }

        /// <summary>
        /// Creates a new Navigation button.
        /// </summary>
        /// <param name="text">Display text</param>
        /// <param name="icon">Display icon</param>
        /// <param name="type">Destination page type</param>
        /// <param name="isChecked">State</param>
        public NavigationButton(String text, String icon, Type type, Boolean isChecked = false)
        {
            this.Text = text;
            this.Icon = icon;
            this.Type = type;
            this.IsChecked = isChecked;
        }
    }
}
