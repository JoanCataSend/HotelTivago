<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HotelTivago.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>HotelTrivago - Login</title>
    <style>

        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #4a8ef0, #6bb4ff);
            height: 100vh;
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-wrapper {
            width: 360px;
            background: #ffffff;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.25);
            animation: fadeIn 0.8s ease;
        }

        .login-title {
            font-size: 28px;
            text-align: center;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .login-subtitle {
            text-align: center;
            font-size: 15px;
            color: #555;
            margin-bottom: 25px;
        }

        .input-text {
            width: 100%;
            padding: 12px;
            margin-bottom: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            outline: none;
            transition: 0.2s ease-in-out;
        }

        .input-text:focus {
            border-color: #4a8ef0;
            box-shadow: 0 0 6px rgba(74,142,240,0.4);
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background: #4a8ef0;
            border: none;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
            transition: 0.2s ease-in-out;
        }

        .btn-primary:hover {
            background: #3a78d6;
        }

        .error-label {
            color: red;
            font-size: 14px;
            margin-top: 10px;
            display: block;
            text-align: center;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to   { opacity: 1; transform: translateY(0); }
        }

    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="login-wrapper">

        <h1 class="login-title">Login</h1>
        <p class="login-subtitle">Access your HotelTrivago account</p>

        <!-- Username -->
        <asp:TextBox 
            ID="txtUser" 
            runat="server" 
            CssClass="input-text" 
            placeholder="Username">
        </asp:TextBox>

        <!-- Password -->
        <asp:TextBox 
            ID="txtPass" 
            runat="server" 
            CssClass="input-text" 
            TextMode="Password" 
            placeholder="Password">
        </asp:TextBox>

        <!-- Login button -->
        <asp:Button 
            ID="btnLogin" 
            runat="server" 
            Text="Log In" 
            CssClass="btn-primary" 
            OnClick="btnLogin_Click" />

        <!-- Error message -->
        <asp:Label 
            ID="lblError" 
            runat="server" 
            CssClass="error-label">
        </asp:Label>

    </div>

</form>

</body>
</html>
