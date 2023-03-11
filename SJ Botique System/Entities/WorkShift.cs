using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class WorkShift
    {
        // Data Members
        private int Id;
        private string Name;
        private string TimeIn;
        private string TimeOut;
        // Methods

        public int GetId()
        {
            return this.Id;
        }
        public void SetId(int _id)
        {
            this.Id = _id;
        }
        public string GetName()
        {
            return this.Name;
        }
        public void SetName(string _name)
        {
            this.Name = _name;
        }
        public string GetShiftHours()
        {
            return this.TimeIn + " " + this.TimeOut;
        }
        public void SetTimeIn(string _time_in)
        {
            this.TimeIn = _time_in;
        }
        public void SetTimeOut(string _time_out)
        {
            this.TimeOut = _time_out;
        }
        public string GetTimeIn()
        {
            return this.TimeIn;
        }
        public string GetTimeOut()
        {
            return this.TimeOut;
        }
        public WorkShift(string _name, string _time_in, string _time_out)
        {
          
            this.Name = _name;
            this.TimeIn = _time_in;
            this.TimeOut = _time_out;
        }
    }
}