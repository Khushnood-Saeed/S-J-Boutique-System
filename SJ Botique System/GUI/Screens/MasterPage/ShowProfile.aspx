<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Screens/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="ShowProfile.aspx.cs" Inherits="SJ_Botique_System.GUI.Screens.MasterPage.ShowProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background: linear-gradient(to top, lightgrey, whitesmoke)">
        <hr>
        <br />
        <div class="container-fluid justify-content-sm-end w-50">

            <div class="row justify-content-md-end">
                <div class="col justify-content-lg-end">
                    <center>
                        <p>
                            <h4 style="font: bold 50px verdana;">User Profile</h4>
                        </p>

                    </center>
                </div>
            </div>
            <hr>
        </div>
        <center>
            <div class="col-3 mx-auto" style="display: flex">
                <label><b>Name &nbsp &nbsp &nbsp</b></label>
                <asp:TextBox class="form-control" ID="txtName" Style="outline: 0; border-width: 0 0 2px; border-color: navy; background-color: transparent; text-align: center" runat="server" placeholder="User Name" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="col-3 mx-auto" style="display: flex">
                <label><b>Age&nbsp &nbsp &nbsp</b></label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="txtAge" Style="outline: 0; border-width: 0 0 2px; border-color: navy; background-color: transparent; text-align: center" runat="server" placeholder="Age" ReadOnly="true" TextMode="Number"></asp:TextBox>
                </div>
            </div>

            <div class="col-3 mx-auto" style="display: flex">
                <label><b>Email Address &nbsp &nbsp &nbsp</b></label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="txtEmail" Style="outline: 0; border-width: 0 0 2px; border-color: navy; background-color: transparent; text-align: center" runat="server" placeholder="Email Address" ReadOnly="true"></asp:TextBox>
                </div>
            </div>

            <div class="col-3 mx-auto" style="display: flex">
                <label><b>Contact &nbsp &nbsp &nbsp</b></label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="txtContact" Style="outline: 0; border-width: 0 0 2px; border-color: navy; background-color: transparent; text-align: center" runat="server" placeholder="Contact" ReadOnly="true"></asp:TextBox>
                </div>
            </div>

            <div class="col-3 mx-auto" style="display: flex">
                <label><b>Address &nbsp &nbsp &nbsp</b></label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="txtAddress" Style="outline: 0; border-width: 0 0 2px; border-color: navy; background-color: transparent; text-align: center" runat="server" placeholder="Address" ReadOnly="true"></asp:TextBox>
                </div>
            </div>

            <div class="col-3 mx-auto" style="display: flex">
                <label><b>Role &nbsp &nbsp &nbsp</b></label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="txtRoleName" Style="outline: 0; border-width: 0 0 2px; border-color: navy; background-color: transparent; text-align: center" runat="server" placeholder="Role" ReadOnly="true"></asp:TextBox>
                </div>
            </div>

            <div class="col-3 mx-auto">
                <label><b>Permissions: </b></label>

            </div>
            <asp:GridView ID="GridView2" runat="server" CssClass="m-lg-4" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-Font-Names="Courier New, monospace" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Names="Courier New, monospace" ItemStyle-Width="30%">
                        <HeaderStyle HorizontalAlign="Center" Font-Names="Courier New,monospace"></HeaderStyle>

                        <ItemStyle Font-Names="Courier New,monospace" Width="30%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" HeaderText="Description" HeaderStyle-Font-Names="Courier New, monospace" ItemStyle-Font-Names="Courier New, monospace" ItemStyle-Width="80%">
                        <HeaderStyle Font-Names="Courier New,monospace"></HeaderStyle>

                        <ItemStyle Font-Names="Courier New,monospace" Width="80%"></ItemStyle>
                    </asp:BoundField>
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
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="ml-5 m-2">Back to Home</asp:LinkButton>
    </div>
</asp:Content>
