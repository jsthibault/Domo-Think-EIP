using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*--------------------------------------------------------
 * ViewFactory.cs
 * 
 * Version: 1.0
 * Author: Filipe
 * Created: 09/09/2016 12:26:33
 * 
 * Notes:
 * -------------------------------------------------------*/

namespace DomoThink.Services
{
    public static class ViewFactory
    {
        #region FIELDS

        private static Dictionary<Type, Type> coupleViewModelView = new Dictionary<Type, Type>();

        #endregion

        #region PROPERTIES



        #endregion

        #region CONSTRUCTORS



        #endregion

        #region METHODS

        /// <summary>
        /// Register a TViewModel and TView couple.
        /// </summary>
        /// <typeparam name="TViewModel"></typeparam>
        /// <typeparam name="TView"></typeparam>
        public static void Register<TViewModel, TView>()
        {
            if (KeyExists(typeof(TViewModel)))
                throw new Exception("The key already exists");

            coupleViewModelView.Add(typeof(TViewModel), typeof(TView));
        }

        /// <summary>
        /// Gets the view type by specifying the TViewModel type.
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static Type Get(Type type)
        {
            if (KeyExists(type))
                return coupleViewModelView[type];

            throw new KeyNotFoundException();
        }

        /// <summary>
        /// Check if the key exists.
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        private static Boolean KeyExists(Type type)
        {
            return coupleViewModelView.ContainsKey(type);
        }

        #endregion
    }
}
