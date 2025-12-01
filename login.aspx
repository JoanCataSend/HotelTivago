<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HotelTivago.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>HotelTivago - Login</title>
    <link href="Content/site.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">

        <div class="login-wrapper">

            <div class="login-box">

                <h1 class="login-title">Login</h1>
                <p class="login-subtitle">Access your account</p>

                <div class="form-group">
                    <label for="txtUser">Username</label>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="input-text"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtPass">Password</label>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="input-text"></asp:TextBox>
                </div>

                <asp:Label ID="lblError" runat="server" CssClass="error-text"></asp:Label>

                <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="btn-primary login-button" OnClick="btnLogin_Click" />

            </div>

        </div>

    </form>

</body>
</html>
