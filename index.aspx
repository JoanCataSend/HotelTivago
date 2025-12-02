<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HotelTivago.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <title>HotelTrivago</title>

    <!-- ============================
         FULL EMBEDDED CSS
         ============================ -->
    <style>

        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: linear-gradient(135deg, #4a8ef0, #6bb4ff);
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .home-container {
            text-align: center;
            background: rgba(255, 255, 255, 0.92);
            padding: 40px;
            border-radius: 16px;
            width: 420px;
            box-shadow: 0 4px 25px rgba(0,0,0,0.2);
            animation: fadeIn 1s ease;
        }

        .title {
            font-size: 36px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .subtitle {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
        }

        .btn-login {
            display: inline-block;
            background: #4a8ef0;
            color: white;
            padding: 14px 25px;
            font-size: 18px;
            border-radius: 10px;
            text-decoration: none;
            transition: 0.2s ease-in-out;
        }

        .btn-login:hover {
            background: #3a78d6;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="home-container">

            <h1 class="title">HotelTrivago</h1>
            <p class="subtitle">Manage reservations easily and securely</p>

            <a href="login.aspx" class="btn-login">Go to Login</a>

        </div>

    </form>

</body>

</html>
