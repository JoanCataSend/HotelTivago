<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receptionist.aspx.cs" Inherits="HotelTivago.receptionist" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Receptionist - Manage Reservations</title>
    <link href="Content/site.css" rel="stylesheet" />
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
        <asp:GridView ID="gvReservations" runat="server" AutoGenerateColumns="False" CssClass="table"
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

        <h2 class="subtitle">Create a new reservation</h2>

        <!-- Create Reservation Form -->
        <div class="create-box">
            <asp:TextBox ID="txtNewUsername" runat="server" CssClass="input-text" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtNewArrival" runat="server" CssClass="input-text" placeholder="Arrival date (YYYY-MM-DD)"></asp:TextBox>
            <asp:TextBox ID="txtNewDeparture" runat="server" CssClass="input-text" placeholder="Departure date (YYYY-MM-DD)"></asp:TextBox>
            <asp:TextBox ID="txtNewRoom" runat="server" CssClass="input-text" placeholder="Room Type"></asp:TextBox>

            <asp:Button ID="btnCreate" runat="server" Text="Create Reservation" CssClass="btn-primary" OnClick="btnCreate_Click" />
        </div>

    </div>
</form>

</body>
</html>
