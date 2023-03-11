using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class Attendance
    {
        // Data Members
        private int Id;
        private SalesManager salesManager;
        
        // Methods
        public Attendance( int _id)
        {
            this.Id= _id;
        }
    }
}