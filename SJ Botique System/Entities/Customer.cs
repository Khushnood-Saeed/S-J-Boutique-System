using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class Customer : User
    {
        private ShoppingCart Cart;
        private List<Order> Orders;
        private LoyaltyPoints Points;
       // private CardCategory
        public Customer(string _name, int _age, string _address, string _email, string _password, string _contact, LoyaltyPoints _loyaltyPoints) 
            : base(_name, _age, _address, _email, _password, _contact)
        {
            this.Points = _loyaltyPoints;
        }
        
        public double GetLoyaltyPoints()
        {
            return this.Points.GetValue();
        }
        public void UpdateLoyaltyPoints(LoyaltyPoints _loyaltyPoints)
        {
            this.Points = _loyaltyPoints;
        }
    }
}