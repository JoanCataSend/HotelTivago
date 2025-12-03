<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HotelTivago.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta charset="utf-8" />
<title>Login - Hotel Tivago</title>

<style>
    body {
        margin: 0;
        padding: 0;
        background: url('images/h6.jpg') center/cover no-repeat;
        font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-container {
        width: 360px;
        background: #ffffff54;
        padding: 35px;
        border-radius: 18px;
        text-align: center;
        box-shadow: 0 8px 30px rgba(0,0,0,0.22);
        backdrop-filter: blur(6px);
        animation: fadeIn 0.8s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        color: #ffffff;
        font-size: 26px;
        margin-bottom: 25px;
        font-weight: 600;
    }

    .input-text {
        width: 85%;
        padding: 12px;
        margin-bottom: 15px;
        border-radius: 10px;
        border: 1px solid #b5b5b5;
        font-size: 15px;
        transition: all 0.2s ease;
    }

    .input-text:focus {
        border-color: #2c64c9;
        box-shadow: 0 0 6px rgba(44,100,201,0.4);
        outline: none;
    }

    .btn {
        width: 85%;
        background: #758fa8;
        color: white;
        padding: 12px;
        border-radius: 10px;
        border: none;
        font-size: 16px;
        cursor: pointer;
        transition: 0.25s;
        margin-top: 5px;
    }

    .btn:hover {
        background: #0c1c38;
        transform: scale(1.02);
    }

    .error {
        margin-top: 12px;
        color: #d40000;
        font-weight: 600;
    }
</style>

</head>

<body>
<form id="form1" runat="server">

<div class="login-container">
    <h2>Iniciar Sesión</h2>

    <asp:TextBox ID="txtUser" runat="server" CssClass="input-text" placeholder="Usuario"></asp:TextBox>

    <asp:TextBox ID="txtPass" runat="server" CssClass="input-text" TextMode="Password" placeholder="Contraseña"></asp:TextBox>

    <asp:Button ID="btnLogin" runat="server" Text="Entrar" CssClass="btn" OnClick="btnLogin_Click" />
    <br />
    <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
</div>

</form>
</body>

</html>