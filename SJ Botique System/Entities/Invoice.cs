using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class Invoice
    {
        private int Id;
        private Payment payment;
        
        public int GetId()
        {
            return this.Id;
        }
        public void SetId(int _id)
        {
            this.Id = _id;
        }
        public Invoice( int _id)
        {
            this.Id = _id;
        }
    }
}