using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.Entities
{
    public class Supplier :User
    {
        // Data Members
        List<Product> Products;

        // Methods
        public Supplier(string _name, int _age, string _address, string _email, string _password, string _contact) : base ( _name, _age, _address, _email, _password, _contact)
        {
           
        }

    }
}