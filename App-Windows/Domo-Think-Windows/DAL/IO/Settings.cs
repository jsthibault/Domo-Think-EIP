using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.IO
{
    public class Settings
    {
        private StreamReader reader;
        private String file;


        public Settings(String settingFile)
        {
            this.file = settingFile;
        }

        public void Load()
        {
        }

        public void Save()
        {
        }
    }
}
