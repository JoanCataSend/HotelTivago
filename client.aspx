<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="HotelTivago.Pages.client" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>My Profile - Hotel Tivago</title>
    <link rel="stylesheet" href="css/style_advanced.css" />
</head>

<body class="backend-page">
<form id="form1" runat="server">

<div class="container">
    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btnLogout" OnClick="btnLogout_Click" />

    <h1>My Profile</h1>
    <h2 class="title">Personal Information</h2>

    <div class="section-box">
        <label>Username:</label> 
        <span class="value"><asp:Label ID="lblUsername" runat="server" /></span>

        <label>Name:</label> 
        <span class="value"><asp:Label ID="lblName" runat="server" /></span>

        <label>Date of Birth:</label> 
        <span class="value"><asp:Label ID="lblDOB" runat="server" /></span>

        <label>Address:</label> 
        <span class="value"><asp:Label ID="lblAddress" runat="server" /></span>

        <label>Mobile:</label> 
        <span class="value"><asp:Label ID="lblMobile" runat="server" /></span>
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
