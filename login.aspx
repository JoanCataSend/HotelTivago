<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HotelTivago.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta charset="utf-8" />
<title>Login - HotelTivago</title>

<style>
body {
    margin: 0;
    padding: 0;
    background: linear-gradient(135deg, #4a8ef0, #6bb4ff);
    font-family: Arial, sans-serif;
}

.login-container {
    width: 380px;
    margin: 120px auto;
    background: #ffffffee;
    padding: 35px;
    border-radius: 14px;
    text-align: center;
    box-shadow: 0 4px 18px rgba(0,0,0,0.25);
}

h2 {
    color: #2c64c9;
    margin-bottom: 25px;
}

.input-text {
    width: 100%;
    padding: 12px;
    margin-bottom: 14px;
    border-radius: 8px;
    border: 1px solid #ccc;
}

.btn {
    width: 100%;
    background: #2c64c9;
    color: #fff;
    padding: 12px;
    border-radius: 8px;
    border: none;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover {
    background: #1e4d99;
}

.error {
    color: red;
    font-weight: bold;
    margin-top: 10px;
}
</style>

</head>

<body>
<form id="form1" runat="server">

<div class="login-container">
    <h2>Login</h2>

    <asp:TextBox ID="txtUser" runat="server" CssClass="input-text" placeholder="Username"></asp:TextBox>
    <asp:TextBox ID="txtPass" runat="server" CssClass="input-text" TextMode="Password" placeholder="Password"></asp:TextBox>

    <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="btn" OnClick="btnLogin_Click" />

    <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
</div>

</form>
</body>

</html>
