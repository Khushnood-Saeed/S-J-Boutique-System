using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class FloorManager :SalesManager
    {
        //Data Members
            private WorkShift workShift;
        // Methods
        public FloorManager(string _name, int _age, string _address, string _email, string _password, string _contact)
            : base(_name, _age, _address, _email, _password, _contact)
        {

        }
        public override string GetStaffType()
        {
            return "FloorManager";
        }
        public override void MarkAttendance()
        {
           
        }
        public void ViewAttendance()
        {

        }
        public void ModifyWorkShift()
        {

        }
        public string ViewWorkShift()
        {
            return this.workShift.GetShiftHours();
        }
    }
}