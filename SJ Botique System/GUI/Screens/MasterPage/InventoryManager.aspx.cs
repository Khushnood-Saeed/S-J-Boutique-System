using SJ_Botique_System.App_Start;
using SJ_Botique_System.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SJ_Botique_System.GUI.Screens.MasterPage
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void ShowData()
        {
            StringBuilder query = new StringBuilder();
            List<Policy> Collection = new List<Policy>();//this list will contain objects of inventory policy
            query.Clear();
            query.Append($"SELECT Id, Policy_Type,Description FROM [Policy]");//query to bring policy table from database
            var result = DbUtility.GetDataTable(query.ToString());
            foreach (DataRow row in result.Rows)//this loop will traverse through all rows of the table
            {
                int Id = Convert.ToInt32(row["Id"]);//bringing value of cloumn Id of Policy table
                string Type = row["Policy_Type"].ToString();//bringing value of Policy type from Policy table
                string Description = row["Description"].ToString();//bringing Description from Policy Table
                if(Type=="Inventory Policy")//if policy type is Inventory then making InventoryPolicy object and adding to list
                {
                    Collection.Add(new InventoryPolicy(Id, Description));
                }
                else//if policy type is Discount then making DiscountPolicy object and adding to list
                {
                    // Discount Policy
                    Collection.Add(new DiscountPolicy(Id, Description));
                }
            }
            GridView2.DataSource = result;
            GridView2.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Id = (Session["userId"]?.ToString())?.Trim();
                if (String.IsNullOrEmpty(Id))
                {
                    Response.Redirect("Login.aspx");//if d is NULL the user will be directed to login page
                }
                else
                {
                    string Path = Request.QueryString["from"]; // Use of Query String 
                    if (Path == "PolicyButton")
                    {
                        InventoryManagerContent.Visible = true;
                        ShowData();
                    }
                }
            }

        }
        protected void cmdView_Click(object sender, EventArgs e)//Delete Policy Function
        {

            int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;//brings the index of row at which buton is clicked
            int Id_to_del = Convert.ToInt32(GridView2.Rows[rowind].Cells[0].Text);//0 index of that row gives us the ID of Policy
            StringBuilder query = new StringBuilder();


            query.Clear();
            query.Append($"DELETE FROM [Policy] WHERE Id='" + Id_to_del + "'");//query to delete specific Id 
            var result = DbUtility.GetDataTable(query.ToString());
           
            GridView2.DataSource = result;
            GridView2.DataBind();
            query.Clear();
            query.Append($"Select * FROM [Policy]");//Again selecting the fresh data and displaying to inventory manager
            result = DbUtility.GetDataTable(query.ToString());
            
            GridView2.DataSource = result;
            GridView2.DataBind();


        }
        protected void Add_policy(object sender, EventArgs e)
        {

           string type= policy_type.SelectedValue;//brings the value from checkbox either its Inventory or Discount

            string myStringFromTheInput = myTextBox.Value;//brings the value of text

            if (myStringFromTheInput == "")//checking that input field should not be empty
            {
                FailturePolicy.Text = "Please Enter Valid Data";
                SuccessPolicy.Text = "";
            }
            else//if it has text
            {
                StringBuilder query = new StringBuilder();
                query.Clear();
                query.Append($"insert into [Policy] values('"+type+"','"+myStringFromTheInput+"')" );//insertion query

                var result = DbUtility.GetDataTable(query.ToString());
                GridView2.AutoGenerateColumns = false;
                GridView2.DataSource = result;
                GridView2.DataBind();

                query.Clear();
                query.Append($"Select * FROM [Policy]");//displaying fresh data
                result = DbUtility.GetDataTable(query.ToString());
                GridView2.AutoGenerateColumns = false;
                GridView2.DataSource = result;
                SuccessPolicy.Text = "New Policy Added";//success message
                FailturePolicy.Text = "";//failure message
                GridView2.DataBind();
                myTextBox.Value = "";//clearing the text input field

            }

        }

        
    }
}