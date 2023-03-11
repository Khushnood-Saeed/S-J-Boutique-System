using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SJ_Botique_System.Interfaces
{
    interface OutletOperations
    {
         void BlockOutlet();
        void UpdateOutlet(string _name,string _location);
    }
}
