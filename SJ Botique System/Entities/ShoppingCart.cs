using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class ShoppingCart
    {
        // Data Members
        private int Id;
        private List<Product> Products;
        
        // Methods 
        public int GetId()
        {
            return this.Id;
        }
        public void SetId( int _id)
        {
            this.Id = _id;
        }
        public ShoppingCart()
        {

        }
        public void AddToCart(Product _product)
        {
            this.Products.Add(_product);
        }
        public void EmptyCart()
        {
            this.Products.Clear();
        }
        public void RemoveFromCart(Product _product)
        {
            if(this.Products.Contains(_product))
            {
                this.Products.Remove(_product);
            }
        }

    }
}