using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class OrderDetails
    {
        // Data Members
        private int Id;
        private List<Product> Products;
        
        // Methods
        public int GetId()
        {
            return this.Id;
        }
        public  void SetId(int _id)
        {
            this.Id = _id;
        }
       public void AddProduct(Product _product)
        {
            if(!this.Products.Contains(_product))
            {
                 this.Products.Add(_product);
            }
        }
        public void RemoveProduct(Product _product)
        {
            if (this.Products.Contains(_product))
            {
                this.Products.Remove(_product);
            }
        }
        public bool ContainProduct(Product _product)
        {
            return this.Products.Contains(_product);
        }
        OrderDetails(int _id)
        {
            this.Id = _id;
        }
    }
}