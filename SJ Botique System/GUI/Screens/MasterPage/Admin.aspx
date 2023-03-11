<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Screens/MasterPage/Site2.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SJ_Botique_System.GUI.Screens.MasterPage.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <hr />
    <center>
        <h1>Admin  </h1>
    <hr />
    <%--<asp:Table ID="Table1" runat="server"></asp:Table>--%>
    <asp:GridView ID="roleGridView" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan"
        BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AutoGenerateColumns="False" Width="530px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />

        <RowStyle HorizontalAlign="Center" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Bottom" CssClass="pl-2" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" HeaderText="Description" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Bottom" />
                    </asp:BoundField>
                </Columns>
    </asp:GridView>
    </center>
</asp:Content>
