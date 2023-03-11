using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
   abstract public class SalesManager : Staff
    {
        // Methods
        public SalesManager(string _name, int _age, string _address, string _email, string _password, string _contact)
            : base(_name, _age, _address, _email, _password, _contact)
        {

        }
        override abstract public string GetStaffType();
        abstract public void MarkAttendance();
    }
}