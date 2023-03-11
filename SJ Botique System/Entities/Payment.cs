using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
   abstract public class Payment
    {
        // Data Members
        protected int Id;
        protected Order order;
        private Customer customer;

        // Methods
        public int GetId()
        {
            return this.Id;
        }
        public void SetId(int _id)
        {
            this.Id = _id;
        }

      abstract  public  void MakePayment();
        public Payment( int _id)
        {
            this.Id = _id;
        }
    }
}