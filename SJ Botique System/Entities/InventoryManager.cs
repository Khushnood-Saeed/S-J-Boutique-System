using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SJ_Botique_System.Interfaces;

namespace SJ_Botique_System.Entities
{
    public class InventoryManager :Staff
    {
        // Data Member 
        OutletInventoryOperations outletInventoryOperations;


        // Methods
        public InventoryManager(string _name, int _age, string _address, string _email, string _password, string _contact)
          : base(_name, _age, _address, _email, _password, _contact)
        {

        }
        override public string GetStaffType()
        {
            return "InventoryManager";
        }
        public void AllocateInventory(Product _product)
        {
            outletInventoryOperations.AllocateInventory(_product);
        }
        public void RemoveInventory(Product _product)
        {
            outletInventoryOperations.RemoveInventory(_product);
        }
    }
}