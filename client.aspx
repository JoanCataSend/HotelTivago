<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="HotelTivago.client" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
<title>My Profile - HotelTivago</title>

<style>

body {
    background: url('images/h4.jpg') center/cover no-repeat;
    margin: 0;
    padding: 0;
    font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
}

.container {
    max-width: 900px;
    margin: 30px auto;
    padding: 30px;
    background: #fff;
    border-radius: 16px;
    box-shadow: 0 5px 25px rgba(0,0,0,0.15);
}

h1 { 
    text-align:center; 
    color:#2c64c9; 
    font-weight:700;
}

.title { 
    color:#2c64c9; 
    font-size:22px; 
    margin-top:30px;
}

.section-box {
    background:#758fa863;
    padding:20px;
    border-radius:12px;
    margin-bottom:20px;
    border:1px solid #e3e9f5;
    box-shadow:0 3px 12px rgba(0,0,0,0.05);
}

label {
    font-weight:bold;
    color:#333;
}

.value {
    display:block;
    margin-bottom:14px;
    font-size:16px;
}

.grid {
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}

.grid th {
    background:#758fa8;
    color:white;
    padding:12px;
    border:1px solid #ddd;
}

.grid td {
    background:white;
    padding:10px;
    border:1px solid #bcd3f9;
}

.grid tr:hover td {
    background:#f0f5ff;
    transition:0.2s;
}

.btnLogout {
    background:#b33a3a;
    color:white;
    border:none;
    padding:10px 18px;
    border-radius:8px;
    cursor:pointer;
    float:right;
    margin-bottom:20px;
    font-size:15px;
}

.btnLogout:hover {
    background:#992f2f;
}

</style>

</head>

<body>
<form id="form1" runat="server">

<div class="container">

<asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btnLogout" OnClick="btnLogout_Click" />

<h1>My Profile</h1>

<h2 class="title">Personal Information</h2>

<div class="section-box">
    <label>Username:</label> <span class="value"><asp:Label ID="lblUsername" runat="server"></asp:Label></span>
    <label>ID Number:</label> <span class="value"><asp:Label ID="lblID" runat="server"></asp:Label></span>
    <label>Name:</label> <span class="value"><asp:Label ID="lblName" runat="server"></asp:Label></span>
    <label>Date of Birth:</label> <span class="value"><asp:Label ID="lblDOB" runat="server"></asp:Label></span>
    <label>Address:</label> <span class="value"><asp:Label ID="lblAddress" runat="server"></asp:Label></span>
    <label>Mobile:</label> <span class="value"><asp:Label ID="lblMobile" runat="server"></asp:Label></span>
</div>

<h2 class="title">My Reservations</h2>

<asp:GridView ID="gvClientReservations" runat="server" AutoGenerateColumns="False" CssClass="grid">
<Columns>
    <asp:BoundField DataField="reservation_id" HeaderText="ID" />
    <asp:BoundField DataField="arrival" HeaderText="Arrival" />
    <asp:BoundField DataField="departure" HeaderText="Departure" />
    <asp:BoundField DataField="room_type" HeaderText="Room Type" />
</Columns>
</asp:GridView>

</div>

</form>
</body>
</html>
