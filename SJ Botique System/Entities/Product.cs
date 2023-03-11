using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class Product
    {
        // Data Members
        private int Id;
        private string Name;
        private double Price;
        private int Quantity;

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
        public double GetPrice()
        {
            return this.Price;
        }
        public void SetPrice(int _price)
        {
            this.Price = _price;
        }
        public int GetQuantity()
        {
            return this.Quantity;
        }
        public void SetQuantity(int _quantity)
        {
            this.Quantity = _quantity;
        }
        public Product(string _name, double _price)
        {
            this.Name = _name;
            this.Price = _price;
        }
    }
}