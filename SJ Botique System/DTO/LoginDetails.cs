using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SJ_Botique_System.DTO
{
    public class LoginDetails
    {
        public int UserId;
        public string RollName;
        public string Name;

        public LoginDetails(int _userId, string _roleName, string _name)
        {
            this.UserId = _userId;
            this.RollName = _roleName;
            this.Name = _name;
        }
    }
}