<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Screens/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="SJ_Botique_System.GUI.Screens.Master_Page.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function togglePassword() {
            var ref = $("#ContentPlaceHolder1_inputpass");
            if (ref[0].type == "password") {
                ref[0].type = "text";
            }
            else {
                ref[0].type = "password";
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        input[type = password], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type = text], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
    <section>
        <img src="../../imgs/upper-img-home.png" class="embed-responsive" />
    </section>
    <div id="bghome">
        <hr>
        <br />
        <div class="container-fluid justify-content-sm-end w-50">
            <%--  <div class="card justify-content-md-end">
               <div class="card-body justify-content-md-end">  --%>
            <center>
                <img height="100" width="100" src="../../imgs/user.png" />
            </center>
            <%-- </div>
                  </div>
            --%>
            <div class="row justify-content-md-end">
                <div class="col justify-content-lg-end">
                    <center>
                        <p>
                            <h4 style="font: bold 50px verdana;">Sign Up</h4>
                            <asp:LinkButton ID="LinkButton13" runat="server" OnClick="LinkButton13_Click"><p style="color:white;font:italic 15px verdana;">Already have an Account? Login.</p></asp:LinkButton></p>

                    </center>
                </div>
            </div>
            <hr>
        </div>
        <center>
            <%--<span class="badge badge-pill badge-info">Credentials</span>--%>
            <div class="container justify-content-md-end">
                <div class="row justify-content-md-center w-50">
                    <div class="col-6">
                        <label><b>Full Name</b></label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="txtName" runat="server" placeholder="Full Name"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-2">
                        <label><b>Age</b></label>
                        <div class="form-group mt-2">
                            <asp:TextBox class="form-control" ID="txtAge" runat="server" placeholder="" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-3 mx-auto">
                <label><b>Email</b></label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="txtEmail" runat="server" placeholder="Email Address"></asp:TextBox>
                </div>
            </div>
            <div class="col-3 mx-auto">
                <label><b>Address</b></label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="txtAddress" runat="server" placeholder="Address"></asp:TextBox>
                </div>
            </div>
            <div class="col-3 mx-auto">
                <label><b>Contact Number</b></label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="txtContact" runat="server" placeholder="+92xxxxxxxxxx" TextMode="Phone"></asp:TextBox>
                </div>
            </div>
            <div class="col-3 mx-auto">
                <b>Create Password</b><br />
                <asp:TextBox ID="inputpass" runat="server" TextMode="Password"></asp:TextBox>
                <div class="row justify-content-md-start">
                    &nbsp &nbsp
                    <input id="Checkbox1" type="checkbox" onchange="togglePassword();" />
                    &nbsp<i> Show Password</i>
                </div>
            </div>
            <br />
            <div class="col mx-auto">
                <center>
                    <div class="form-group">
                        <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Create Account" Width="300" OnClick="SignUp_Clicked" />
                        <asp:Label ID="Failture" ForeColor="Red" runat="server" Text=""></asp:Label>
                    </div>
            </div>
    </div>
    <br />

    <img src="../../imgs/bottom-img-home.png" class="embed-responsive" />

    <%--<asp:GridView ID="GridView1" runat="server" CssClass="m-lg-4">
    <Columns>
        <asp:BoundField  DataField="Id" HeaderText="Sno"/>
        <asp:BoundField DataField="Name" HeaderText="Name"/>
        <asp:BoundField DataField="Price" HeaderText="Price"/>
    </Columns>
</asp:GridView>--%>
</asp:Content>
