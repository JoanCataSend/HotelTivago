<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receptionist.aspx.cs" Inherits="HotelTivago.receptionist" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Receptionist Panel</title>

    <!-- ============================
         EMBEDDED CSS (FULL DESIGN)
         ============================ -->
    <style>

        body {
            background: #eef2f3;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .receptionist-container {
            max-width: 950px;
            margin: 40px auto;
            background: #fff;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.15);
        }

        .title {
            font-size: 32px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            text-align: center;
        }

        .subtitle {
            font-size: 18px;
            color: #666;
            text-align: center;
            margin-bottom: 25px;
        }

        .input-text {
            width: 100%;
            padding: 12px;
            margin-bottom: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            outline: none;
            transition: 0.2s ease-in-out;
        }

        .input-text:focus {
            border-color: #4a8ef0;
            box-shadow: 0 0 5px rgba(74, 142, 240, 0.4);
        }

        .btn-primary {
            background: #4a8ef0;
            color: #fff;
            border: none;
            padding: 10px 18px;
            font-size: 15px;
            cursor: pointer;
            border-radius: 8px;
            transition: 0.2s ease-in-out;
        }

        .btn-primary:hover {
            background: #3a78d6;
        }

        .search-box {
            display: flex;
            gap: 10px;
            margin-bottom: 25px;
        }

        .create-box {
            background: #f9fafc;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 25px;
            border: 1px solid #e0e0e0;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
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

        .table a {
            padding: 6px 12px;
            border-radius: 6px;
            color: #fff;
            text-decoration: none;
            margin: 0 3px;
        }

        .table a[title="Edit"] {
            background: #4CAF50;
        }

        .table a[title="Delete"] {
            background: #f44336;
        }

        .table a:hover {
            opacity: 0.85;
        }

        @media (max-width: 768px) {
            .search-box {
                flex-direction: column;
            }
        }

    </style>
</head>

<body>

<form id="form1" runat="server">
    <div class="receptionist-container">

        <h1 class="title">Receptionist Panel</h1>
        <p class="subtitle">Manage hotel reservations</p>

        <!-- Search Section -->
        <div class="search-box">
            <asp:TextBox ID="txtSearchUser" runat="server" CssClass="input-text" placeholder="Search by username"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" CssClass="btn-primary" Text="Search" OnClick="btnSearch_Click" />
        </div>

        <!-- Reservations Table -->
        <asp:GridView 
            ID="gvReservations" 
            runat="server" 
            AutoGenerateColumns="False"
            CssClass="table"
            DataKeyNames="reservation_id"
            OnRowEditing="gvReservations_RowEditing"
            OnRowCancelingEdit="gvReservations_RowCancelingEdit"
            OnRowUpdating="gvReservations_RowUpdating"
            OnRowDeleting="gvReservations_RowDeleting">

            <Columns>
                <asp:BoundField DataField="reservation_id" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="username" HeaderText="Username" />
                <asp:BoundField DataField="arrival" HeaderText="Arrival" />
                <asp:BoundField DataField="departure" HeaderText="Departure" />
                <asp:BoundField DataField="room_type" HeaderText="Room Type" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>

        </asp:GridView>


        <!-- Create Reservation -->
        <h2 class="subtitle">Create a New Reservation</h2>

        <div class="create-box">
            <asp:TextBox ID="txtNewUsername" runat="server" CssClass="input-text" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtNewArrival" runat="server" CssClass="input-text" placeholder="Arrival date (YYYY-MM-DD)"></asp:TextBox>
            <asp:TextBox ID="txtNewDeparture" runat="server" CssClass="input-text" placeholder="Departure date (YYYY-MM-DD)"></asp:TextBox>
            <asp:TextBox ID="txtNewRoom" runat="server" CssClass="input-text" placeholder="Room Type"></asp:TextBox>

            <asp:Button ID="btnCreate" runat="server" Text="Create Reservation" CssClass="btn-primary" OnClick="btnCreate_Click" />
        </div>


        <!-- Create Client Account -->
        <h2 class="subtitle">Create New Client</h2>

        <div class="create-box">
            <asp:TextBox ID="txtNewClientUser" runat="server" CssClass="input-text" placeholder="Client username"></asp:TextBox>
            <asp:TextBox ID="txtNewClientPass" runat="server" CssClass="input-text" placeholder="Client password"></asp:TextBox>

            <asp:Button ID="btnCreateClient" runat="server" Text="Create Client" CssClass="btn-primary" OnClick="btnCreateClient_Click" />
        </div>

    </div>
</form>

</body>
</html>
