<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgot.aspx.cs" Inherits="forgot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Forgot </title>

    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link type="text/css" href="css/theme.css" rel="stylesheet" />
    <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />

</head>

<body>
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                    <i class="icon-reorder shaded"></i>
                </a>
                 <a class="brand">
                        <img src="images/LOGO.png" class="nav-avatar" />
                        ANTI CORRUPTION BUREAU </a>
            </div>
        </div>
        <!-- /navbar-inner -->
    </div>
    <!-- /navbar -->
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="module module-login span4 offset4">
                    <form id="form1" runat="server">
                        <div class="module-head">
                            <h3>Forgot Password</h3>
                        </div>
                        <div class="module-body">
                            Username 
                            <br />
                            <asp:TextBox ID="TextBox1" runat="server" Width="90%"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Username Required" ForeColor="Red" ControlToValidate="TextBox1" />
                            <br />
                            Encrypted Password
                            <br />
                            <asp:TextBox ID="TextBox2" runat="server" type="password" Width="90%"></asp:TextBox>
                           
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Encypted Password Required" ForeColor="Red" ControlToValidate="TextBox2" />
                               <br/>
                            <br/>
                          
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get Password" Width="33%" class="btn btn-primary pull-center" />
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                            <br />
                            <br />
                            <asp:Label ID="Label1" runat="server" BackColor="White" ForeColor="Red"></asp:Label>
                           <br />
                             <a href="login.aspx">Login </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--/.wrapper-->

    <div class="footer">
        <div class="container">
            <b class="copyright">&copy; 2014-2015 ANTI CORRUPTION BUREAU </b>All rights reserved.
        </div>
    </div>

</body>
</html>