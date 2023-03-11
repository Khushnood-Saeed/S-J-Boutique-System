using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using static SJ_Botique_System.Entities.Permission;

namespace SJ_Botique_System.Entities
{
    public  class Role
    {
        //Data Members
        private int Id;
        private string Name;
        private string Description;
        private List<Permission> Permissions ;
        
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
        public string GetDescription()
        {
            return this.Description;
        }
        public void SetDescription(string _description)
        {
            this.Description = _description;
        }
        public void AddPermission(Permission _permission)
        {
            this.Permissions.Add(_permission);
            this.Permissions = this.Permissions.Distinct().ToList(); // to remove redundancy 
        }
        public void DeletePermission(Permission _permission)
        {
            this.Permissions.Remove(_permission);
        }
        public Role(int _id,string _name, string _description)
        {
            this.Name = _name;
            this.Description = _description;
            this.Id = _id;
        }
    }
}