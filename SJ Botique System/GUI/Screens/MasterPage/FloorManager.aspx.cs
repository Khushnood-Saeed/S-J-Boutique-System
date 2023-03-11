using SJ_Botique_System.App_Start;
using SJ_Botique_System.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.WebControls;
using System.Data;

namespace SJ_Botique_System.GUI.Screens.MasterPage
{
    public partial class WebForm3 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string Id = (Session["userId"]?.ToString())?.Trim();
                if (String.IsNullOrEmpty(Id))
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    string whichPage = Request.QueryString["from"]; // Use of Query String 
                    if(whichPage== "workShiftButton")
                    {
                        ShowData();
                    }
                }
            }
        }
        protected void gridWorkShift_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ShowData()
        {
            List<WorkShift> Collection = new List<WorkShift>();
            StringBuilder query = new StringBuilder();
            query.Clear();
            query.Append($"Select Id,Name, Time_in, Time_out from WorkShift");
            var result = DbUtility.GetDataTable(query.ToString());
            if(result.Rows.Count>0)
            {
                gridWorkShift.DataSource = result;
                gridWorkShift.DataBind();

                // code to Make List of WorkShifts
                foreach (DataRow row in result.Rows)
                {
                    int Id = Convert.ToInt32(row["Id"]);
                    string Name = row["Name"].ToString();
                    string Time_In = row["Time_in"].ToString();
                    string Time_Out = row["Time_out"].ToString();
                    WorkShift W = new WorkShift(Name, Time_In, Time_Out);
                    W.SetId(Id);
                    Collection.Add(W); // Creating List for Workshifts
                }
            }
            else
            {
                result.Rows.Add(result.NewRow());
                gridWorkShift.DataSource = result;
                gridWorkShift.DataBind();
                gridWorkShift.Rows[0].Cells.Clear();
                gridWorkShift.Rows[0].Cells.Add(new TableCell());
                gridWorkShift.Rows[0].Cells[0].ColumnSpan = gridWorkShift.Columns.Count;
                gridWorkShift.Rows[0].Cells[0].Text = "No WorkShift Created Yet !";
                gridWorkShift.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        protected void gridWorkShift_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Code for Adding New Workshift
            try
            {
                StringBuilder query = new StringBuilder();
                if (e.CommandName.Equals("Add"))
                {

                    // Code to Add New Workshift  Executed for Footer Row
                    query.Clear();
                    query.Append("Insert into WorkShift (Name, Time_in, Time_out) values (@Name, @Time_in, @Time_out)");
                    string Name = (gridWorkShift.FooterRow.FindControl("txtNameFooter") as TextBox).Text.Trim();
                    string T_in = (gridWorkShift.FooterRow.FindControl("txtTimeInFooter") as TextBox).Text.Trim();
                    string T_out = (gridWorkShift.FooterRow.FindControl("txtTimeOutFooter") as TextBox).Text.Trim();
                    if (!String.IsNullOrEmpty(Name) && !String.IsNullOrEmpty(T_in) && !String.IsNullOrEmpty(T_out))
                    {
                        WorkShift Obj = new WorkShift(Name,T_in, T_out);
                        var result = DbUtility.AddWorkshift(query.ToString(),Obj);
                        ShowData();
                        Success.Text = "New WorkShift Added";
                        Failture.Text = "";
                    }
                    else
                    {
                        Success.Text = "";
                        Failture.Text = " Please Enter Valid Data";
                    }
                }
            } 
            catch(Exception ex)
            {
                Success.Text = "";
                Failture.Text = ex.Message;
            }

        }
        protected void gridWorkShift_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Editing Work Shift
            try
            {
                gridWorkShift.EditIndex = e.NewEditIndex;
                var Id = e.NewEditIndex;
                ShowData();

            }
            catch (Exception ex)
            {
                Success.Text = "";
                Failture.Text = ex.Message;
            }
        }
        protected void gridWorkShift_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            // Code to Cancel Editing 
            try
            {
                gridWorkShift.EditIndex = -1;
                ShowData();
            }
            catch (Exception ex)
            {
                Success.Text = "";
                Failture.Text = ex.Message;
            }
        }
        protected void gridWorkShift_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                // Code to Update Workshift
                StringBuilder query = new StringBuilder();
                query.Clear();
                query.Append("Update WorkShift Set Name=@Name , Time_in = @Time_in , Time_out=@Time_out where Id = @Id");
                int Id = Convert.ToInt32(gridWorkShift.DataKeys[e.RowIndex].Value.ToString());
                string Name = (gridWorkShift.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text.Trim();
                string T_in = (gridWorkShift.Rows[e.RowIndex].FindControl("txtTimeIn") as TextBox).Text.Trim();
                string T_out = (gridWorkShift.Rows[e.RowIndex].FindControl("txtTimeOut") as TextBox).Text.Trim();
                if (!String.IsNullOrEmpty(Name) && !String.IsNullOrEmpty(T_in) && !String.IsNullOrEmpty(T_out))
                {
                    DateTime Time_in = DateTime.Parse(T_in);
                    DateTime Time_out = DateTime.Parse(T_out);
                    var result = DbUtility.UpdateWorkshift(query.ToString(), Name, Time_in, Time_out, Id);
                    gridWorkShift.EditIndex = -1;
                    ShowData();
                    Success.Text = "WorkShift has been Updated ";
                    Failture.Text = "";
                }
                else
                {
                    Success.Text = "";
                    Failture.Text = " Please Enter Valid Data";
                }
            }
            catch (Exception ex)
            {
                Success.Text = "";
                Failture.Text = ex.Message;
            }
        }
        protected void gridWorkShift_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // Code to Update Workshift
                StringBuilder query = new StringBuilder();
                query.Clear();
                query.Append("Delete from  WorkShift where Id = @Id");
                int Id = Convert.ToInt32(gridWorkShift.DataKeys[e.RowIndex].Value.ToString());
                var result = DbUtility.DeleteWorkshift(query.ToString(),Id);
                gridWorkShift.EditIndex = -1;
                ShowData();
                Success.Text = "WorkShift has been Deleted ";
                Failture.Text = "";
            }
            catch (Exception ex)
            {
                Success.Text = "";
                Failture.Text = ex.Message;
            }
        }
    }
}