using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class DiscountPolicy:Policy
    {
        string Type;
        //Methods
       override public void  AddPolicy()
        {

          
        }
        override public void ModifyPolicy()
        {


        }
        override public string GetPolicyType()
        {
            return this.Type;
        }
        public DiscountPolicy(int _id,string _description):base( _id, _description)
        {
            this.Type = "Discount Policy";
        }
    }
}