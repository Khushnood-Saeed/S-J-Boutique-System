using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class InventoryPolicy:Policy
    {
        string Type;
        //Methods
       override public void AddPolicy()
        {

            
        }
       override public void ModifyPolicy()
        {


        }
        override public string GetPolicyType()
        {
            return Type;
        }
        public InventoryPolicy(int _id, string _description) : base(_id, _description)
        {

            this.Type = "Inventory Policy";
        }
    }
}