using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using SJ_Botique_System.App_Start;

namespace SJ_Botique_System.GUI.Screens.MasterPage
{
    public partial class ShowProfile : System.Web.UI.Page
    {
        protected void ShowData()
        {
            try
            {
                StringBuilder query = new StringBuilder();
                int Id = Convert.ToInt32((Session["userId"]?.ToString())?.Trim());
                // Code for User Profile
                query.Clear();
                query.Append($"SELECT U.Name,Age,Email,Contact,U.Address, UR.Role_Id as RoleId, R.Name as Role From [User] U ");
                query.Append($"join User_Role UR on U.Id=UR.U_ID join [Role] R on UR.Role_Id = R.Id where U.Id= {Id}");
                var result = DbUtility.GetDataTable(query.ToString());
                int RoleId = (int)result.Rows[0]["RoleId"];
                var Row = result.Rows[0];
                txtName.Text = Row["Name"].ToString();
                txtAge.Text = Row["Age"].ToString();
                txtEmail.Text = Row["Email"].ToString();
                txtContact.Text = Row["Contact"].ToString();
                txtRoleName.Text = Row["Role"].ToString();
                txtAddress.Text = Row["Address"].ToString();

                query.Clear();
                query.Append($"select  P.Name, P.Description from Role_Permission PR join Permission P on PR.Permission_id=P.Id where PR.Role_id= {RoleId}");
                result = DbUtility.GetDataTable(query.ToString());
                GridView2.AutoGenerateColumns = false;
                GridView2.DataSource = result;
                GridView2.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = (Session["userId"]?.ToString())?.Trim();
                if (String.IsNullOrEmpty(Id))
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    ShowData();
                }
                string roleName = Session["roleName"].ToString();
                if (roleName == "Customer")
                {
                    LinkButton1.Visible = false;
                }
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string role = Session["roleName"].ToString();
            if (role == "Admin")
            {
                Response.Redirect("Admin.aspx");
            }
            else if (role == "Floor Manager")
            {
                Response.Redirect("FloorManager.aspx");
            }
            else if (role == "Inventory Manager")
            {
                Response.Redirect("InventoryManager.aspx");
            }
            else if (role == "Customer")
            {
                Response.Redirect("DisplayProducts.aspx");
            }
        }
    }
}