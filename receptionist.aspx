<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receptionist.aspx.cs" Inherits="HotelTivago.Pages.receptionist" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Receptionist Panel</title>
    <link rel="stylesheet" href="css/style_advanced.css" />
</head>

<body class="backend-page">
<form id="form1" runat="server">
<div class="container">

    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btnLogout" OnClick="btnLogout_Click" />

    <h1>Receptionist Panel</h1>

    <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
    <br /><br />

    <h2 class="title">Search reservations</h2>
    <div class="search-box">
        <asp:TextBox ID="txtSearchReservations" runat="server" CssClass="input-text" placeholder="Search reservations by username"></asp:TextBox>
        <asp:Button ID="btnSearchReservations" runat="server" Text="Search" CssClass="btn" OnClick="btnSearchReservations_Click" />
    </div>

    <h2 class="title">Manage hotel reservations</h2>

    <asp:GridView ID="gvReservations" runat="server" AutoGenerateColumns="False" CssClass="grid"
        DataKeyNames="reservation_id"
        OnRowEditing="gvReservations_RowEditing"
        OnRowUpdating="gvReservations_RowUpdating"
        OnRowCancelingEdit="gvReservations_RowCancelingEdit"
        OnRowDeleting="gvReservations_RowDeleting">

        <Columns>
            <asp:BoundField DataField="reservation_id" HeaderText="ID" ReadOnly="true" />
            <asp:BoundField DataField="username" HeaderText="Username" ReadOnly="true" />
            <asp:BoundField DataField="arrival" HeaderText="Arrival" />
            <asp:BoundField DataField="departure" HeaderText="Departure" />
            <asp:BoundField DataField="room_type" HeaderText="Room Type" />
            <asp:CommandField
                ShowEditButton="true"
                EditText="Edit"
                UpdateText="Update"
                CancelText="Cancel"
                ShowDeleteButton="true"
                DeleteText="Delete" />
        </Columns>
    </asp:GridView>

    <h3 class="title">Create new reservation</h3>
    <div class="section-box">
        <asp:TextBox ID="txtRUser" runat="server" CssClass="input-text" placeholder="Username"></asp:TextBox>
        <asp:TextBox ID="txtRArrival" runat="server" CssClass="input-text" placeholder="Arrival (dd/mm/yyyy)"></asp:TextBox>
        <asp:TextBox ID="txtRDeparture" runat="server" CssClass="input-text" placeholder="Departure (dd/mm/yyyy)"></asp:TextBox>
        <asp:DropDownList ID="ddlRRoom" runat="server" CssClass="input-text">
            <asp:ListItem Text="Select room type" Value="" />
            <asp:ListItem Text="Normal" Value="Normal" />
            <asp:ListItem Text="Double" Value="Double" />
            <asp:ListItem Text="Suite" Value="Suite" />
</asp:DropDownList>

        <asp:Button ID="btnCreateReservation" runat="server" Text="Create reservation" CssClass="btn" OnClick="btnCreateReservation_Click" />
    </div>

    <h2 class="title">Search users</h2>
    <div class="search-box">
        <asp:TextBox ID="txtSearchUsers" runat="server" CssClass="input-text" placeholder="Search users by username or name"></asp:TextBox>
        <asp:Button ID="btnSearchUsers" runat="server" Text="Search" CssClass="btn" OnClick="btnSearchUsers_Click" />
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
            <asp:BoundField DataField="profile" HeaderText="Profile" ReadOnly="true" />
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="dob" HeaderText="DOB" />
            <asp:BoundField DataField="address" HeaderText="Address" />
            <asp:BoundField DataField="mobile" HeaderText="Mobile" />
            <asp:CommandField
                ShowEditButton="true"
                EditText="Edit"
                UpdateText="Update"
                CancelText="Cancel"
                ShowDeleteButton="true"
                DeleteText="Delete" />
        </Columns>
    </asp:GridView>

    <h3 class="title">Create new client</h3>

    <div class="section-box">
        <asp:TextBox ID="txtCUsername" runat="server" CssClass="input-text" placeholder="Username"></asp:TextBox>
        <asp:TextBox ID="txtCPassword" runat="server" CssClass="input-text" placeholder="Password"></asp:TextBox>
        <asp:TextBox ID="txtCName" runat="server" CssClass="input-text" placeholder="Name"></asp:TextBox>
        <asp:TextBox ID="txtCDOB" runat="server" CssClass="input-text" placeholder="DOB (dd/mm/yyyy)"></asp:TextBox>
        <asp:TextBox ID="txtCAddress" runat="server" CssClass="input-text" placeholder="Address"></asp:TextBox>
        <asp:TextBox ID="txtCMobile" runat="server" CssClass="input-text" placeholder="Mobile"></asp:TextBox>

        <asp:Button ID="btnCreateClient" runat="server" Text="Create Client" CssClass="btn" OnClick="btnCreateClient_Click" />
    </div>

</div>
</form>
</body>
</html>
