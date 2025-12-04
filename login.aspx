<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HotelTivago.Pages.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta charset="utf-8" />
<title>Login - Hotel Tivago</title>
<link rel="stylesheet" href="css/style_advanced.css" />

</head>

<body class="login-page">
<form id="form1" runat="server">

<div class="login-container">
    <h2>Login</h2>

    <asp:TextBox ID="txtUser" runat="server" CssClass="input-text" placeholder="Username"></asp:TextBox>

    <asp:TextBox ID="txtPass" runat="server" CssClass="input-text" TextMode="Password" placeholder="Password"></asp:TextBox>

    <asp:Button ID="btnLogin" runat="server" Text="Entrar" CssClass="btn" OnClick="btnLogin_Click" />

    <asp:Button ID="btnBack" runat="server" Text="Back to Home" CssClass="btnBack" OnClick="btnBack_Click" />
    <br />
    <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
</div>

</form>
</body>

</html>
