using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SJ_Botique_System.Interfaces;

namespace SJ_Botique_System.Entities
{
    public class Admin :Staff
    {
        // Data Member
        private static Admin Instance = null;
        OutletOperations outletOperations ;
        RoleOperations roleOperations;
        // Methods
        public Admin(string _name, int _age, string _address, string _email, string _password, string _contact)
            : base(_name, _age, _address, _email, _password, _contact)
        {

        }
        private Admin() : base("Admin",22,"Abc","xyz@gmail.com","123456","021456789")
        {

        }
        public static Admin GetInstance()
        {
            if (Instance == null)
            {
                Instance = new Admin();
            }
            return Instance;
        }
        override  public string GetStaffType()
        {
            return "Admin";
        }
        public void AssignRole(User _user, Role _role)
        {
            _user.AddRole(_role);
        }
       public  void DeleteRole(User _user, Role _role)
        {
            _user.DeleteRole(_role);
        }
        public void BlockOutlet()
        {
            this.outletOperations.BlockOutlet();
        }
        public void UpddateOutlet(string _name, string _location)
        {
            this.outletOperations.UpdateOutlet(_name, _location);
        }
    }
}