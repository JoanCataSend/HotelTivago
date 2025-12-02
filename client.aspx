<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="HotelTivago.client" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>My Reservations</title>

    <style>

        body {
            background: #eef2f3;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .client-container {
            max-width: 850px;
            margin: 40px auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.15);
        }

        .title {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
            color: #333;
        }

        .subtitle {
            font-size: 18px;
            text-align: center;
            margin-bottom: 25px;
            color: #666;
        }

        /* TABLE STYLE */
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .table th {
            background: #4a8ef0;
            color: white;
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            font-weight: bold;
        }

        .table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
            background: #fff;
        }

        .table tr:nth-child(even) td {
            background: #f7f9fb;
        }

        .table tr:hover td {
            background: #e9f2ff;
        }

    </style>
</head>

<body>

<form id="form1" runat="server">
    <div class="client-container">

        <h1 class="title">Welcome!</h1>
        <p class="subtitle">These are your reservations</p>

        <asp:GridView 
            ID="gvClientReservations" 
            runat="server" 
            AutoGenerateColumns="True" 
            CssClass="table">
        </asp:GridView>

    </div>
</form>

</body>
</html>
