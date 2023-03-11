using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class POS :Outlet
    {
        // Data Members


        // Methods
        public POS(int _id, string _name, string _location, string _status = "Active") : base(_id, _name, _location, _status)
        {

        }
        override public string GetOutletType()
        {
            return "POS";
        }
    }
}