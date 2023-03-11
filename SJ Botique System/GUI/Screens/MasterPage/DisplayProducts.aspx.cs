using SJ_Botique_System.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SJ_Botique_System.Entities;

namespace SJ_Botique_System.GUI.Screens.MasterPage
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Id = (Session["userId"]?.ToString())?.Trim();
            if (String.IsNullOrEmpty(Id))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                ShowProducts();
            }
        }
        protected void ShowProducts()
        {
            StringBuilder query = new StringBuilder();
            List<Product> Collection = new List<Product>();
            // Code Working Fine for Show All Products
            query.Clear();
            query.Append($"SELECT Id, Name, Description , Price FROM Product");
            var result = DbUtility.GetDataTable(query.ToString());
            GridView1.AutoGenerateColumns = false;
            GridView1.DataSource = result;
            GridView1.DataBind();

            foreach (DataRow row in result.Rows)
            {
                int Id = Convert.ToInt32(row["Id"]);
                string Name = row["Name"].ToString();
                double Price = double.Parse(row["Price"].ToString());
                Product W = new Product(Name, Price);
                W.SetId(Id);
                Collection.Add(W);
            }
        }

    }
}