using SJ_Botique_System.App_Start;
using SJ_Botique_System.DTO;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SJ_Botique_System.GUI.Screens.Master_Page
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinkButton50_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
        protected void verifyLogin(object sender, EventArgs e)
        {
            StringBuilder query = new StringBuilder();
            query.Clear();
            query.Append($"[dbo].[log_in]");
            string email = txtEmail.Text;
            string password = pass.Text;
            LoginDetails CurrentUser = DbUtility.InsertForLogin(query.ToString(), email, password);
            if (CurrentUser.UserId != -1)
            {
                // Valid User 
                Session["userId"] = CurrentUser.UserId;
                Session["roleName"] = CurrentUser.RollName;
                Session["Name"] = CurrentUser.Name;
                if (CurrentUser.RollName == "Admin")
                {
                   Response.Redirect("Admin.aspx");
                }
                else if (CurrentUser.RollName == "Floor Manager")
                {
                    Response.Redirect("FloorManager.aspx");
                }
                else if (CurrentUser.RollName == "Inventory Manager")
                {
                    Response.Redirect("InventoryManager.aspx");
                }
                else if (CurrentUser.RollName == "Customer")
                {
                    Response.Redirect("DisplayProducts.aspx");
                }
            }
            else
            {
                // Invalid Credentials
                Failture.Text = "Please Enter Valid Credentials";
            }

        }
    }
}