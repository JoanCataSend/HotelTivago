<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="HotelTivago.client" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta charset="utf-8" />
<title>My Profile - HotelTivago</title>

<style>

body {
    background: #eef2f3;
    margin: 0;
    padding: 0;
    font-family: Arial;
}

.container {
    max-width: 900px;
    margin: 40px auto;
    background: #fff;
    padding: 30px;
    border-radius: 14px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.15);
}

h1 {
    color: #2c64c9;
    text-align: center;
}

.section-title {
    color: #2c64c9;
    font-size: 22px;
    margin-top: 25px;
}

.info-box {
    background: #f6f8fa;
    padding: 20px;
    border-radius: 12px;
}

label {
    font-weight: bold;
    color: #333;
}

.value {
    padding: 4px 0 14px 0;
    display: block;
    font-size: 15px;
}

.grid {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}

.grid th {
    background: #000;
    color: white;
    padding: 10px;
}

.grid td {
    padding: 10px;
    border: 1px solid #ddd;
}

</style>
</head>

<body>
<form id="form1" runat="server">

<div class="container">

<h1>My Profile</h1>

<h2 class="section-title">Personal Information</h2>

<div class="info-box">
    <label>Username:</label> <span class="value"><asp:Label ID="lblUsername" runat="server"></asp:Label></span>
    <label>ID Number:</label> <span class="value"><asp:Label ID="lblID" runat="server"></asp:Label></span>
    <label>Name:</label> <span class="value"><asp:Label ID="lblName" runat="server"></asp:Label></span>
    <label>Date of Birth:</label> <span class="value"><asp:Label ID="lblDOB" runat="server"></asp:Label></span>
    <label>Address:</label> <span class="value"><asp:Label ID="lblAddress" runat="server"></asp:Label></span>
    <label>Mobile:</label> <span class="value"><asp:Label ID="lblMobile" runat="server"></asp:Label></span>
</div>

<h2 class="section-title">My Reservations</h2>

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
