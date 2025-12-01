<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HotelTivago.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>HotelTivago - Welcome</title>
    <link href="Content/site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="landing-container">
            <h1 class="landing-title">Welcome to HotelTivago</h1>
            <p class="landing-subtitle">Your trusted hotel</p>

            <asp:Button ID="btnLogin" runat="server" CssClass="btn-primary" Text="Log in" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
