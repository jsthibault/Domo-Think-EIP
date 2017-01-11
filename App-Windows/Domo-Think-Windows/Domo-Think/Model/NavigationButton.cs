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

namespace DomoThink.Model
{
    public class NavigationButton
    {
        /// <summary>
        /// Gets or sets the icon.
        /// </summary>
        public String Icon { get; set; }

        /// <summary>
        /// Gets or sets the destination view model type.
        /// </summary>
        public Type ViewModelType { get; set; }

        /// <summary>
        /// Gets or sets the destination view type.
        /// </summary>
        public Type ViewType { get; set; }

        /// <summary>
        /// Gets or sets the display text.
        /// </summary>
        public String Text { get; set; }

        /// <summary>
        /// Gets or sets the page title.
        /// </summary>
        public String Title { get; set; }

        /// <summary>
        /// Gets or sets the current button state.
        /// </summary>
        public Boolean IsChecked { get; set; }


        /// <summary>
        /// Creates a new Navigation button.
        /// </summary>
        public NavigationButton()
            : this("NULL", "NULL", "NULL", null, null, false)
        { }

        /// <summary>
        /// Creates a new Navigation button.
        /// </summary>
        /// <param name="text">Display text</param>
        /// <param name="icon">Display icon</param>
        /// <param name="viewType">Destination page type</param>
        /// <param name="isChecked">State</param>
        public NavigationButton(String text, String title, String icon, Type viewType, Type viewModelType, Boolean isChecked = false)
        {
            this.Text = text;
            this.Title = title;
            this.Icon = icon;
            this.ViewType = viewType;
            this.ViewModelType = viewModelType;
            this.IsChecked = isChecked;
        }
    }
}
