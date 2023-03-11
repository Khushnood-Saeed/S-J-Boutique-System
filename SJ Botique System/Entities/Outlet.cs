using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SJ_Botique_System.Interfaces;

namespace SJ_Botique_System.Entities
{
    abstract public class Outlet : OutletOperations
    {
        // Data Members
        protected int Id;
        protected string Name;
        protected string Location;
        protected string Status;  // Blocked or Activated
        protected List<Product> Inventory;

        // Methods
        public Outlet(int _id, string _name, string _location, string _status="Active")
        {
            this.Id = _id;
            this.Name = _name;
            this.Location = _location;
            this.Status = _status;
        }

        public void SetId(int _id)
        {
            this.Id = _id;
        }
        public int GetId()
        {
            return this.Id;
        }
        public string GetName()
        {
            return this.Name;
        }
        public string GetLocation()
        {
            return this.Location;
        }
        public string GetStatus()
        {
            return this.Status;
        }
        public void BlockOutlet()
        {
            this.Status = "Blocked";
        }
        public void UpdateOutlet(string _name, string _location)
        {
            this.Name = _name;
            this.Location = _location;
        }
        abstract public string GetOutletType();
    }
}