<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receptionist.aspx.cs" Inherits="HotelTivago.receptionist" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
<title>Receptionist Panel</title>

<style>
body {
    background: #eef2f3;
    margin: 0;
    padding: 0;
    font-family: Arial;
}

.container {
    max-width: 1100px;
    margin: 30px auto;
    padding: 30px;
    background: #fff;
    border-radius: 16px;
    box-shadow: 0 5px 25px rgba(0,0,0,0.15);
}

h1 { text-align:center; color:#2c64c9; }
.title { color:#2c64c9; font-size:22px; }

.input-text {
    width:100%; padding:12px; margin-bottom:10px;
    border-radius:8px; border:1px solid #ccc; font-size:15px;
}

.btn {
    background:#000; color:#fff;
    padding:10px 18px; border-radius:8px;
    border:none; cursor:pointer; font-size:15px;
}
.btn:hover { opacity:0.8; }

.section-box {
    background:#f2f5f7; padding:20px;
    border-radius:12px; margin-bottom:20px;
}

.grid {
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}
.grid th {
    background:#000; color:white; padding:10px; border:1px solid #ddd;
}
.grid td {
    padding:10px; border:1px solid #ddd;
}
</style>
</head>

<body>
<form id="form1" runat="server">
<div class="container">

<h1>Receptionist Panel</h1>


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
    <asp:TextBox ID="txtRArrival" runat="server" CssClass="input-text" placeholder="Arrival"></asp:TextBox>
    <asp:TextBox ID="txtRDeparture" runat="server" CssClass="input-text" placeholder="Departure"></asp:TextBox>
    <asp:TextBox ID="txtRRoom" runat="server" CssClass="input-text" placeholder="Room type"></asp:TextBox>

    <asp:Button ID="btnCreateReservation" runat="server" Text="Create reservation" CssClass="btn" OnClick="btnCreateReservation_Click" />
</div>


<h2 class="title">Manage hotel clients</h2>

<asp:GridView ID="gvClients" runat="server" AutoGenerateColumns="False" CssClass="grid"
    DataKeyNames="username"
    OnRowEditing="gvClients_RowEditing"
    OnRowUpdating="gvClients_RowUpdating"
    OnRowCancelingEdit="gvClients_RowCancelingEdit"
    OnRowDeleting="gvClients_RowDeleting">

<Columns>
    <asp:BoundField DataField="username" HeaderText="Username" ReadOnly="true" />
    <asp:BoundField DataField="profile" HeaderText="Profile" />
    <asp:BoundField DataField="id_number" HeaderText="ID Number" />
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
    <asp:TextBox ID="txtCDOB" runat="server" CssClass="input-text" placeholder="DOB"></asp:TextBox>
    <asp:TextBox ID="txtCAddress" runat="server" CssClass="input-text" placeholder="Address"></asp:TextBox>
    <asp:TextBox ID="txtCMobile" runat="server" CssClass="input-text" placeholder="Mobile"></asp:TextBox>

    <asp:Button ID="btnCreateClient" runat="server" Text="Create Client" CssClass="btn" OnClick="btnCreateClient_Click" />
</div>

</div>
</form>
</body>
</html>
