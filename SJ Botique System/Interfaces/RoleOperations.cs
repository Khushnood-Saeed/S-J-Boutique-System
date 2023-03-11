using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SJ_Botique_System.Entities;

namespace SJ_Botique_System.Interfaces
{
    interface RoleOperations
    {
        void AssignRole(User _user, Role _role);
        void DeleteRole(User _user, Role _role);
    }
}
