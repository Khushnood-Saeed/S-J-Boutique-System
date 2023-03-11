<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Screens/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SJ_Botique_System.GUI.Screens.Master_Page.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function togglePassword() {
            var ref = $("#ContentPlaceHolder1_pass");
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
            <center>
                <img height="100" width="100" src="../../imgs/user.png" />
            </center>

            <div class="row justify-content-md-end">
                <div class="col justify-content-lg-end">
                    <center>
                        <p>
                            <h4 style="font: bold 50px verdana;">Login</h4>
                            <asp:LinkButton ID="LinkButton50" runat="server" OnClick="LinkButton50_Click"><p style="color:white;font:italic 15px verdana;">Don't have an account? SignUp.</p></asp:LinkButton></p>

                    </center>
                </div>
            </div>
            <hr>
        </div>
        <center>
            <span class="badge badge-pill badge-info">Credentials</span>
            <div class="container justify-content-md-end">
                <div class="row justify-content-md-center w-50">
                </div>
            </div>
            <div class="col-3 mx-auto">
                <label><b>Email</b></label>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="txtEmail" runat="server" placeholder=""></asp:TextBox>
                </div>
            </div>
            <div class="col-3 mx-auto">
                <b>Password</b>
                <br />
                <asp:TextBox class="form-control" ID="pass" runat="server" placeholder="" TextMode="Password" />
                <div class="row justify-content-md-start">
                    &nbsp &nbsp &nbsp
                                    <input id="Checkbox1" type="checkbox" onchange="togglePassword();" />
                    &nbsp<i> Show Password</i>
                    <%--<asp:CheckBox OnClientClick="return togglePassword();" ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged1"/>  &nbsp<i> Show Password</i>--%>
                </div>
                <br />
                <div class="col mx-auto">
                    <center>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block btn-lg" ID="btnLogin" OnClick="verifyLogin" runat="server" Text="Login" Width="300" />
                        </div>
                        <asp:Label ID="Failture" ForeColor="Red" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <br />

            <img src="../../imgs/bottom-img-home.png" class="embed-responsive" />
</asp:Content>
