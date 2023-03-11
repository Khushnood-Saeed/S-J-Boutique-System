<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Screens/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="SJ_Botique_System.GUI.Screens.MasterPage.FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .dropbtn {
            background-color: #65a6b3;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 10px;
            width: 50%;
            font-family: Candara;
            font-size: large;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            position:center;
            align-content: center;
            background-color: whitesmoke;
            width:50%;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            border-radius: 10px;
            z-index: 1;
            font-family:Candara;
            padding:1%;
            display: none;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: #418095;
        }
    </style>


    <div style="background: linear-gradient(to top, lightgrey, whitesmoke)">
        <center>
      <h4 style="font:bold 50px verdana; padding-top:4%; padding-bottom:1%">FAQ</h4>

      <div style="min-height:65vh; display:flex; flex-direction:column; justify-content:space-between">
        <div class="dropdown">
          <button class="dropbtn">How do I register myself?</button>
          <div class="dropdown-content">
              <p>Registering with S&JBoutique.com is easy. You can create a unique account by going through the following steps: 

                Click on the “Don't have an account? Sign Up” found on the “Login” screen.
                Enter your unique information on the account creation page.
                Click on the “Create Account” button for account creation. </p>
          </div>
        </div>
      <br />

             <div class="dropdown">
          <button class="dropbtn">What is the delivery time?</button>
          <div class="dropdown-content">
          <p>Order delivery takes 3-5 days, depending on the size and availability of the product. Orders are processed before 1 PM on a working day and are generally scheduled for delivery the following working day.</p>
          </div>
        </div>
      <br />
   <div class="dropdown">
          <button class="dropbtn">What could be the reasons of delayed delivery of my order?</button>
          <div class="dropdown-content">
          <p>Timely delivery is subject to availability of stocks and payment authorizations. In certain cases, we might request for some form of payment verification or source in order to process the order.</p>
          </div>
        </div>
      <br />

            <div class="dropdown">
          <button class="dropbtn">How shall I make a payment?</button>
          <div class="dropdown-content">
          <p>Following are the payment options available for your convenience:

        Cash On Delivery (COD)
        Cards (Debit/Credit)</p>
          </div>
        </div>
      <br />

             <div class="dropdown">
          <button class="dropbtn">How will I know how much my order costs?</button>
          <div class="dropdown-content">
          <p>You will get to know the complete cost for your order at the checkout page. Upon requesting an item, you will receive a confirmation email with complete details for your order, including shipping charges.</p>
          </div>
        </div>
          
      <br />
          </div>
      </center>
</div>

</asp:Content>
