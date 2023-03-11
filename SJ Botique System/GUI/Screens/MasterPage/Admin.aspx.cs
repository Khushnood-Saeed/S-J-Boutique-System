using SJ_Botique_System.App_Start;
using SJ_Botique_System.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SJ_Botique_System.GUI.Screens.MasterPage
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void ShowData()
        {
            try
            {
                StringBuilder query = new StringBuilder();
                List<Role> Collection = new List<Role>();
                query.Clear();
                query.Append($"SELECT Id, Name , Description FROM [Role]");
                var result = DbUtility.GetDataTable(query.ToString());
                foreach (DataRow row in result.Rows)
                {
                    int Id = Convert.ToInt32(row["Id"]);
                    string Name = row["Name"].ToString();
                    string Description = row["Description"].ToString();
                    Collection.Add(new Role(Id, Name, Description));
                }
                roleGridView.DataSource = result;
                roleGridView.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
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
                    string whichPage = Request.QueryString["from"]; // Use of Query String 
                    if (whichPage == "roleManagement")
                    {
                        ShowData();
                    }
                }
            }
        }
    }
}