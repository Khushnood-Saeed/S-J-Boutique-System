using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SJ_Botique_System.GUI.Screens.MasterPage
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string role = Session["roleName"].ToString();
            string Name = Session["Name"]?.ToString()?.Trim();
            LinkButton7.Text = Name;
            if (role=="Admin")
            {
                btnUserManagement.Visible = true;
                btnRoleManagement.Visible = true;
                btnOutlet.Visible = true;
            }
            else if(role== "Floor Manager")
            {
                btnWorkshift.Visible = true;
                btnPerformance.Visible = true;
                btnAttendance.Visible = true;
            }
            else if (role== "Inventory Manager")
            {
                btnSalesReport.Visible = true;
                btnSupplier.Visible = true;
                btnPolicy.Visible = true;

            }
        }
        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreatedBy.aspx");
        }
        protected void workShift(object sender, EventArgs e)
        {
            Response.Redirect("FloorManager.aspx?from=workShiftButton");
        }
        protected void DisplayPolicy(object sender, EventArgs e)
        {
            Response.Redirect("InventoryManager.aspx?from=PolicyButton");
        }
        protected void roleManagement(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx?from=roleManagement");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowProfile.aspx");
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            //Response.Redirect("ShowProfile.aspx");
        }

    }
}