using SJ_Botique_System.App_Start;
using SJ_Botique_System.Entities;
//using SJ_Botique_System.HelperClasses;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SJ_Botique_System.GUI.Screens.Master_Page
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LinkButton13_Click(object sender, EventArgs e)
        { 
          Response.Redirect("Login.aspx");
        }
        protected void SignUp_Clicked(object sender, EventArgs e)
        {
            try
            {

                StringBuilder query = new StringBuilder();
                query.Clear();
                query.Append($"[dbo].[sign_up]");
                string Name = txtName.Text?.Trim();
                int Age = Convert.ToInt32(txtAge.Text);
                string Address = txtAddress.Text?.Trim();
                string Password= inputpass.Text?.Trim();
                string Contact = txtContact.Text?.Trim();
                string Email = txtEmail.Text?.Trim();
                if(!String.IsNullOrEmpty(Name) && !String.IsNullOrEmpty(Address) && !String.IsNullOrEmpty(Password) && !String.IsNullOrEmpty(Contact) && !String.IsNullOrEmpty(Email))
                {
                    int UserId  = DbUtility.InsertForSignUp(query.ToString(),Name ,Email, Password,Age,Contact, Address);

                    // Creating New Customer
                    if(UserId!=-1)
                    {
                        Customer newCustomer = new Customer(Name, Age, Address, Email, Password, Contact, new LoyaltyPoints(0));
                        newCustomer.SetId(UserId);
                        Session["userId"] = UserId;
                        Session["roleName"] = "Customer";
                        Session["Name"] = Name;
                        Response.Redirect("DisplayProducts.aspx");
                    }
                    else
                    {
                        Failture.Text = "User With this Email has already been created";
                        string path = Request.Url.ToString();
                        //Response.Redirect(path);
                    }
                }
                else
                {
                    // Invalid Credentials
                    Failture.Text = "Please Enter Valid Credentials";
                }
            }
            catch (Exception ex)
            {

                Failture.Text = ex.Message;
            }
        }
    }
}