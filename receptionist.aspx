<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receptionist.aspx.cs" Inherits="HotelTivago.receptionist" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
<title>Receptionist Panel</title>

<style>
body {
    background: url('images/h4.jpg') center/cover no-repeat;
    margin: 0;
    padding: 0;
    font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
}

.container {
    max-width: 1100px;
    margin: 30px auto;
    padding: 30px;
    background: #ffffff;
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

.search-box {
    margin-bottom:15px;
    background:#f7f9fc;
    padding:15px;
    border-radius:12px;
    border:1px solid #e3e9f5;
}

.input-text {
    width:95%;
    padding:12px;
    margin-bottom:12px;
    border-radius:10px;
    border:2px solid #d7e2f5;
    background:white;
    font-size:15px;
}

.input-text:focus {
    border-color:#2c64c9;
    box-shadow:0 0 8px rgba(44,100,201,0.3);
    outline:none;
}

.btn {
    background:#758fa8;
    color:white;
    padding:12px 22px;
    border-radius:10px;
    border:none;
    cursor:pointer;
    font-size:16px;
    font-weight:bold;
    transition:0.25s ease;
    box-shadow:0 3px 10px rgba(44,100,201,0.3);
}

.btn:hover {
    transform:translateY(-2px);
    box-shadow:0 5px 14px rgba(44,100,201,0.45);
}

.section-box {
    background:#f7f9fc;
    padding:20px;
    border-radius:12px;
    margin-bottom:20px;
    border:1px solid #e3e9f5;
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

.grid a {
    color:#2c64c9;
    font-weight:bold;
    text-decoration:none;
    margin-right:12px;
}

.grid tr:hover td {
    background:#f0f5ff;
    transition:0.2s;
}
</style>
</head>

<body>
<form id="form1" runat="server">
<div class="container">

<h1>Receptionist Panel</h1>

<!-- 🔴 ERROR LABEL -->
<asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
<br /><br />

<!-- 🔵 SEARCH RESERVATIONS -->
<h2 class="title">Search reservations</h2>
<div class="search-box">
    <asp:TextBox ID="txtSearchReservations" runat="server" CssClass="input-text" placeholder="Search reservations by username"></asp:TextBox>
    <asp:Button ID="btnSearchReservations" runat="server" Text="Search" CssClass="btn" OnClick="btnSearchReservations_Click" />
</div>

<!-- GRID RESERVATIONS -->
<h2 class="title">Manage hotel reservations</h2>

<asp:GridView ID="gvReservations" runat="server" AutoGenerateColumns="False" CssClass="grid"
    DataKeyNames="reservation_id"
    OnRowEditing="gvReservations_RowEditing"
    OnRowUpdating="gvReservations_RowUpdating"
    OnRowCancelingEdit="gvReservations_RowCancelingEdit"
    OnRowDeleting="gvReservations_RowDeleting">

<Columns>
    <asp:BoundField DataField="reservation_id" HeaderText="ID" ReadOnly="true" />
    <asp:BoundField DataField="username" HeaderText="Username" />
    <asp:BoundField DataField="arrival" HeaderText="Arrival" />
    <asp:BoundField DataField="departure" HeaderText="Departure" />
    <asp:BoundField DataField="room_type" HeaderText="Room Type" />
    <asp:CommandField ShowEditButton="true" EditText="Edit" ShowDeleteButton="true" DeleteText="Delete" />
</Columns>
</asp:GridView>

<h3 class="title">Create new reservation</h3>
<div class="section-box">
    <asp:TextBox ID="txtRUser" runat="server" CssClass="input-text" placeholder="Username"></asp:TextBox>
    <asp:TextBox ID="txtRArrival" runat="server" CssClass="input-text" placeholder="Arrival (dd/mm/aaaa)"></asp:TextBox>
    <asp:TextBox ID="txtRDeparture" runat="server" CssClass="input-text" placeholder="Departure (dd/mm/aaaa)"></asp:TextBox>
    <asp:TextBox ID="txtRRoom" runat="server" CssClass="input-text" placeholder="Room type"></asp:TextBox>

    <asp:Button ID="btnCreateReservation" runat="server" Text="Create reservation" CssClass="btn" OnClick="btnCreateReservation_Click" />
</div>

<!-- 🟢 SEARCH USERS -->
<h2 class="title">Search users</h2>
<div class="search-box">
    <asp:TextBox ID="txtSearchUsers" runat="server" CssClass="input-text" placeholder="Search users by username or name"></asp:TextBox>
    <asp:Button ID="btnSearchUsers" runat="server" Text="Search" CssClass="btn" OnClick="btnSearchUsers_Click" />
</div>

<!-- GRID USERS -->
<h2 class="title">Manage hotel clients</h2>

<asp:GridView ID="gvClients" runat="server" AutoGenerateColumns="False" CssClass="grid"
    DataKeyNames="username"
    OnRowEditing="gvClients_RowEditing"
    OnRowUpdating="gvClients_RowUpdating"
    OnRowCancelingEdit="gvClients_RowCancelingEdit"
    OnRowDeleting="gvClients_RowDeleting">

<Columns>
    <asp:BoundField DataField="username" HeaderText="Username" ReadOnly="true" />
    <asp:BoundField DataField="profile" HeaderText="Profile" ReadOnly="true" />
    <asp:BoundField DataField="id_number" HeaderText="ID Number" ReadOnly="true" />
    <asp:BoundField DataField="name" HeaderText="Name" />
    <asp:BoundField DataField="dob" HeaderText="DOB" />
    <asp:BoundField DataField="address" HeaderText="Address" />
    <asp:BoundField DataField="mobile" HeaderText="Mobile" />
    <asp:CommandField ShowEditButton="true" EditText="Edit" ShowDeleteButton="true" DeleteText="Delete" />
</Columns>
</asp:GridView>

<h3 class="title">Create new client</h3>

<div class="section-box">
    <asp:TextBox ID="txtCUsername" runat="server" CssClass="input-text" placeholder="Username"></asp:TextBox>
    <asp:TextBox ID="txtCPassword" runat="server" CssClass="input-text" placeholder="Password"></asp:TextBox>
    <asp:TextBox ID="txtCName" runat="server" CssClass="input-text" placeholder="Name"></asp:TextBox>
    <asp:TextBox ID="txtCDOB" runat="server" CssClass="input-text" placeholder="DOB (dd/mm/aaaa)"></asp:TextBox>
    <asp:TextBox ID="txtCAddress" runat="server" CssClass="input-text" placeholder="Address"></asp:TextBox>
    <asp:TextBox ID="txtCMobile" runat="server" CssClass="input-text" placeholder="Mobile"></asp:TextBox>

    <asp:Button ID="btnCreateClient" runat="server" Text="Create Client" CssClass="btn" OnClick="btnCreateClient_Click" />
</div>

</div>
</form>
</body>
</html>
