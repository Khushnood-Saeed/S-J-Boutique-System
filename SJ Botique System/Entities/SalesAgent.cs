using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class SalesAgent :SalesManager
    {
        //Data Members
       private  WorkShift workShift;
        // Methods
        public SalesAgent(string _name, int _age, string _address, string _email, string _password, string _contact)
           : base(_name, _age, _address, _email, _password, _contact)
        {

        }
       
        public string ViewWorkShift()
        {
           return this.workShift.GetShiftHours();
        }
        public override string GetStaffType()
        {
            return "SalesAgent";
        }
        public override void MarkAttendance()
        {

        }
    }
}