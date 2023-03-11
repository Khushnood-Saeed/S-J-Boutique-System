using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SJ_Botique_System.Entities;

namespace SJ_Botique_System.Interfaces
{
    interface OutletInventoryOperations
    {
        void AllocateInventory(Product _product);
        void RemoveInventory(Product _product);
    }
}
