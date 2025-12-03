using System;
using System.Data;
using System.Data.SQLite;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

namespace HotelTivago
{
    public partial class receptionist : System.Web.UI.Page
    {
        private string DBPath;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "receptionist")
                Response.Redirect("login.aspx");

            DBPath = Server.MapPath("~/bbdd/hoteltrivago.db");

            if (!IsPostBack)
            {
                LoadReservations();
                LoadClients();
            }
        }

        private SQLiteConnection Conn() =>
            new SQLiteConnection("Data Source=" + DBPath + ";Version=3;");

        private void LoadReservations(string search = "")
        {
            using (var c = Conn())
            {
                c.Open();

                var cmd = new SQLiteCommand(
                    "SELECT reservation_id, username, arrival, departure, room_type " +
                    "FROM reservations WHERE username LIKE @s", c);

                cmd.Parameters.AddWithValue("@s", "%" + search + "%");

                using (var da = new SQLiteDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvReservations.DataSource = dt;
                    gvReservations.DataKeyNames = new[] { "reservation_id" };
                    gvReservations.DataBind();
                }
            }
        }

        private void LoadClients(string search = "")
        {
            using (var c = Conn())
            {
                c.Open();

                var cmd = new SQLiteCommand(
                    "SELECT username, profile, id_number, name, dob, address, mobile " +
                    "FROM users WHERE profile='client' AND (username LIKE @s OR name LIKE @s)", c);

                cmd.Parameters.AddWithValue("@s", "%" + search + "%");

                using (var da = new SQLiteDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvClients.DataSource = dt;
                    gvClients.DataKeyNames = new[] { "username" };
                    gvClients.DataBind();
                }
            }
        }

        protected void btnCreateReservation_Click(object sender, EventArgs e)
        {
            if (!ValidationRules.IsValidDate(txtRArrival.Text) ||
                !ValidationRules.IsValidDate(txtRDeparture.Text))
            {
                ShowError("Dates must be dd/mm/aaaa.");
                return;
            }

            using (var c = Conn())
            {
                c.Open();

                var cmd = new SQLiteCommand(
                    "INSERT INTO reservations(username, arrival, departure, room_type) " +
                    "VALUES(@u,@a,@d,@r)", c);

                cmd.Parameters.AddWithValue("@u", txtRUser.Text);
                cmd.Parameters.AddWithValue("@a", txtRArrival.Text);
                cmd.Parameters.AddWithValue("@d", txtRDeparture.Text);
                cmd.Parameters.AddWithValue("@r", txtRRoom.Text);

                cmd.ExecuteNonQuery();
            }

            ClearError();
            LoadReservations();
        }

        protected void btnSearchReservations_Click(object sender, EventArgs e)
        {
            LoadReservations(txtSearchReservations.Text);
        }

        protected void gvReservations_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvReservations.EditIndex = e.NewEditIndex;
            LoadReservations();
        }

        protected void gvReservations_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvReservations.EditIndex = -1;
            LoadReservations();
        }

        protected void gvReservations_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvReservations.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvReservations.Rows[e.RowIndex];

            TextBox txtUser = row.Cells[1].Controls[0] as TextBox;
            TextBox txtArrival = row.Cells[2].Controls[0] as TextBox;
            TextBox txtDeparture = row.Cells[3].Controls[0] as TextBox;
            TextBox txtRoom = row.Cells[4].Controls[0] as TextBox;

            if (!ValidationRules.IsValidDate(txtArrival.Text) ||
                !ValidationRules.IsValidDate(txtDeparture.Text))
            {
                ShowError("Invalid date format. Use dd/mm/aaaa.");
                return;
            }

            using (var c = Conn())
            {
                c.Open();

                var cmd = new SQLiteCommand(
                    "UPDATE reservations SET username=@u, arrival=@a, departure=@d, room_type=@r WHERE reservation_id=@id", c);

                cmd.Parameters.AddWithValue("@u", txtUser.Text);
                cmd.Parameters.AddWithValue("@a", txtArrival.Text);
                cmd.Parameters.AddWithValue("@d", txtDeparture.Text);
                cmd.Parameters.AddWithValue("@r", txtRoom.Text);
                cmd.Parameters.AddWithValue("@id", id);

                cmd.ExecuteNonQuery();
            }

            gvReservations.EditIndex = -1;
            ClearError();
            LoadReservations();
        }

        protected void gvReservations_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvReservations.DataKeys[e.RowIndex].Value);

            using (var c = Conn())
            {
                c.Open();

                var cmd = new SQLiteCommand("DELETE FROM reservations WHERE reservation_id=@id", c);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }

            LoadReservations();
        }

        protected void btnCreateClient_Click(object sender, EventArgs e)
        {
            if (!ValidationRules.IsValidUsername(txtCUsername.Text) ||
                !ValidationRules.IsValidName(txtCName.Text) ||
                !ValidationRules.IsValidDate(txtCDOB.Text) ||
                !ValidationRules.IsValidMobile(txtCMobile.Text))
            {
                ShowError("Invalid fields while creating user.");
                return;
            }

            using (var c = Conn())
            {
                c.Open();

                var cmd = new SQLiteCommand(
                    "INSERT INTO users(username, password, profile, name, dob, address, mobile) " +
                    "VALUES(@u,@p,'client',@n,@d,@a,@m)", c);

                cmd.Parameters.AddWithValue("@u", txtCUsername.Text);
                cmd.Parameters.AddWithValue("@p", PasswordMD5.Hash(txtCPassword.Text));
                cmd.Parameters.AddWithValue("@n", txtCName.Text);
                cmd.Parameters.AddWithValue("@d", txtCDOB.Text);
                cmd.Parameters.AddWithValue("@a", txtCAddress.Text);
                cmd.Parameters.AddWithValue("@m", txtCMobile.Text);

                cmd.ExecuteNonQuery();
            }

            ClearError();
            LoadClients();
        }

        protected void btnSearchUsers_Click(object sender, EventArgs e)
        {
            LoadClients(txtSearchUsers.Text);
        }

        protected void gvClients_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvClients.EditIndex = e.NewEditIndex;
            LoadClients();
        }

        protected void gvClients_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvClients.EditIndex = -1;
            LoadClients();
        }

        protected void gvClients_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string username = gvClients.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = gvClients.Rows[e.RowIndex];

            TextBox txtName = row.Cells[3].Controls[0] as TextBox;
            TextBox txtDob = row.Cells[4].Controls[0] as TextBox;
            TextBox txtAddress = row.Cells[5].Controls[0] as TextBox;
            TextBox txtMobile = row.Cells[6].Controls[0] as TextBox;

            if (!ValidationRules.IsValidName(txtName.Text) ||
                !ValidationRules.IsValidDate(txtDob.Text) ||
                !ValidationRules.IsValidMobile(txtMobile.Text))
            {
                ShowError("Invalid fields.");
                return;
            }

            using (var c = Conn())
            {
                c.Open();

                var cmd = new SQLiteCommand(
                    "UPDATE users SET name=@n, dob=@d, address=@a, mobile=@m WHERE username=@u", c);

                cmd.Parameters.AddWithValue("@n", txtName.Text);
                cmd.Parameters.AddWithValue("@d", txtDob.Text);
                cmd.Parameters.AddWithValue("@a", txtAddress.Text);
                cmd.Parameters.AddWithValue("@m", txtMobile.Text);
                cmd.Parameters.AddWithValue("@u", username);

                cmd.ExecuteNonQuery();
            }

            gvClients.EditIndex = -1;
            ClearError();
            LoadClients();
        }

        protected void gvClients_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string username = gvClients.DataKeys[e.RowIndex].Value.ToString();

            using (var c = Conn())
            {
                c.Open();

                var cmd1 = new SQLiteCommand("DELETE FROM reservations WHERE username=@u", c);
                cmd1.Parameters.AddWithValue("@u", username);
                cmd1.ExecuteNonQuery();

                var cmd2 = new SQLiteCommand("DELETE FROM users WHERE username=@u", c);
                cmd2.Parameters.AddWithValue("@u", username);
                cmd2.ExecuteNonQuery();
            }

            LoadClients();
        }

        private void ShowError(string message)
        {
            if (lblError != null)
                lblError.Text = message;
        }

        private void ClearError()
        {
            if (lblError != null)
                lblError.Text = "";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}
