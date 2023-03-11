using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SJ_Botique_System.Interfaces;

namespace SJ_Botique_System.Entities
{
    public class OutletInventory : OutletInventoryOperations
    {
        // Data Member
        private Outlet outlet;
        private List<Product> Inventory;
        // Methods
        public OutletInventory(Outlet _outlet)
        {
            this.outlet = _outlet;
        }
        public void AllocateInventory(Product _product)
        {
            if(!this.Inventory.Contains(_product))
            {
                this.Inventory.Add(_product);
            }
        }
       public void RemoveInventory(Product _product)
        {
            if (this.Inventory.Contains(_product))
            {
                this.Inventory.Remove(_product);
            }
        }
    }
}