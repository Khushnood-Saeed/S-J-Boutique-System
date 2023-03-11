using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SJ_Botique_System.Interfaces;
using System.Text;

namespace SJ_Botique_System.Entities
{
    public class User
    {
        // Data Members
        protected int Id;
        protected string Name;
        protected int Age;
        protected string Email;
        protected string Address;
        protected string Contact;
        protected string password;
        private List<Role> Roles;
        // Methods
        public int GetId()
        {
            return this.Id;
        }
        public void SetId( int _id)
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
        public int GetAge()
        {
            return this.Age;
        }
        public void SetAge(int _age)
        {
            this.Age = _age;
        }
        public string GetEmail()
        {
            return this.Email;
        }
        public void SetEmail(string _email)
        {
            this.Email = _email;
        }
        public string GetPassword()
        {
            return this.password;
        }
        public void SetPassword(string _password)
        {
            this.password = _password;
        }
        public string GetAddress()
        {
            return this.Address;
        }
        public void SetAddress(string _address)
        {
            this.Address = _address;
        }
        public string GetContact()
        {
            return this.Contact;
        }
        public void SetContact(string _contact)
        {
            this.Contact = _contact;
        }
        public void AddRole(Role _role)
        {
            if (!this.Roles.Contains(_role))
            {
                this.Roles.Add(_role);
            }
        }
        public void DeleteRole(Role _role)
        {
            if(this.Roles.Contains(_role))
            {
                this.Roles.Remove(_role); // removing role
            }
        }
        public User(string _name,int _age, string _address,string _email,string _password, string _contact)
        {
            //Constructor
            this.Name = _name;
            this.password = _password;
            this.Age = _age;
            this.Address = _address;
            this.Email = _email;
            this.Contact = _contact;
        }
    }
}