using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class Order
    {
        // Data Members
        private int Id;
        private OrderDetails OrderDetails;
        
        // Methods
         public int GetId()
        {
            return this.Id;
        }
        public void SetId(int _id)
        {
            this.Id = _id;
        }

        public void AddProduct(Product _product)
        {
           if (!this.OrderDetails.ContainProduct(_product))
            {
                this.OrderDetails.AddProduct(_product);
            }
        }
        public void RemoveProduct(Product _product)
        {
            if (this.OrderDetails.ContainProduct(_product))
            {
                this.OrderDetails.RemoveProduct(_product);
            }
        }
        public Order( int _id)
        {
            this.Id = _id;
        }
    }
}