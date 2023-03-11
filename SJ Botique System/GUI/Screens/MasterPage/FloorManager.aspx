<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Screens/MasterPage/Site2.Master" AutoEventWireup="true" CodeBehind="FloorManager.aspx.cs" Inherits="SJ_Botique_System.GUI.Screens.MasterPage.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <style>
        input[type = text] {
            border: 1px solid #ccc;
        }
    </style>
    <hr />
    <center>
        <h1>Floor Manager </h1>
        <hr />
        &nbsp;<asp:GridView ID="gridWorkShift" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None"
            BorderWidth="1px" CellPadding="3" GridLines="Horizontal" AutoGenerateColumns="False" runat="server" Width="400px"
            OnSelectedIndexChanged="gridWorkShift_SelectedIndexChanged" ShowFooter="True" DataKeyNames="Id"
            ShowHeaderWhenEmpty="True" OnRowCommand="gridWorkShift_RowCommand" OnRowEditing="gridWorkShift_RowEditing"
            OnRowCancelingEdit="gridWorkShift_RowCancelingEdit" OnRowUpdating="gridWorkShift_RowUpdating"
            OnRowDeleting="gridWorkShift_RowDeleting">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
            <RowStyle HorizontalAlign="Center" />
            <Columns>
                <%-- Name --%>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Name")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" Text='<%# Eval("Name")%>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNameFooter" runat="server" />
                    </FooterTemplate>
                    <HeaderStyle Font-Size="Medium" />
                    <ItemStyle Font-Size="Medium" Width="100px" />
                </asp:TemplateField>
                <%-- Time In  --%>
                <asp:TemplateField HeaderText="TimeIn">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Time_in")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTimeIn" Text='<%# Eval("Time_in")%>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTimeInFooter" runat="server" />
                    </FooterTemplate>
                    <ItemStyle Font-Size="Medium" Width="100px" />
                </asp:TemplateField>
                <%-- Time Out --%>
                <asp:TemplateField HeaderText="TimeOut">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Time_out")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTimeOut" Text='<%# Eval("Time_out")%>' runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTimeOutFooter" runat="server" />
                    </FooterTemplate>
                    <ItemStyle Font-Size="Medium" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/GUI/imgs/EditItem.PNG" CommandName="Edit" runat="server" ToolTip="Edit" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/GUI/imgs/DeleteItem.PNG" CommandName="Delete" runat="server" ToolTip="Delete" Width="20px" Height="20px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/GUI/imgs/SaveItem.PNG" CommandName="Update" runat="server" ToolTip="Save" Width="20px" Height="20px" />
                        <asp:ImageButton ImageUrl="~/GUI/imgs/CancelItem.PNG" CommandName="Cancel" runat="server" ToolTip="Cancel" Width="20px" Height="20px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ImageUrl="~/GUI/imgs/AddItem.PNG" CommandName="Add" runat="server" ToolTip="Add" CssClass="ml-3 mt-2" Width="25px" Height="25px" />
                    </FooterTemplate>
                    <ItemStyle Font-Size="Medium" Width="100px" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="Success" Text="" runat="server" ForeColor="Green" />
        <asp:Label ID="Failture" Text="" runat="server" ForeColor="Red" />
    </center>
</asp:Content>
