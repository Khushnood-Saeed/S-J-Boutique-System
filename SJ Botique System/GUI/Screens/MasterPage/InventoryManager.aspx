<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Screens/MasterPage/Site2.Master" AutoEventWireup="true" CodeBehind="InventoryManager.aspx.cs" Inherits="SJ_Botique_System.GUI.Screens.MasterPage.WebForm2" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <hr />
    <center>
        <h1>Inventory Manager </h1>

        <div runat="server" id="InventoryManagerContent" visible="false">

            <asp:GridView ID="GridView2" runat="server" CssClass="m-lg-4" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle HorizontalAlign="Center" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Sno" />
                    <asp:BoundField DataField="Policy_Type" HeaderText="Policy_Type" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="cmdView" class="btn btn-light" Text="Delete" runat="server" CommandName="Delete" OnClick="cmdView_Click" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--        <br /><br />--%>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            <br />
            <h3>Select the type of policy</h3>
            <br />
            <asp:RadioButtonList ID="policy_type" runat="server">
                <asp:ListItem Value="Inventory" Selected="True"> Inventory Policy</asp:ListItem>
                <asp:ListItem Value="Discount"> Discount Policy</asp:ListItem>
            </asp:RadioButtonList>

          

            <input type="text" name="email" id="myTextBox" runat="server" style="width: 45%; height: 100px;" />
            <br />
            <asp:Button ID="btn3" class="btn btn-primary mt-3" Text="Add" runat="server" CommandName="Add" OnClick="Add_policy" />
        </div>
    </center>
    <hr />
    <asp:Label ID="SuccessPolicy" Text="" runat="server" ForeColor="Green" />
    <asp:Label ID="FailturePolicy" Text="" runat="server" ForeColor="Red" />
</asp:Content>
