using System;
using System.Data;
using System.Data.SQLite;
using System.Web.UI.WebControls;

namespace HotelTivago
{
    public partial class receptionist : System.Web.UI.Page
    {
        string DB;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "receptionist")
            {
                Response.Redirect("login.aspx");
                return;
            }

            DB = Server.MapPath("~/bbdd/hoteltrivago.db");

            if (!IsPostBack)
            {
                LoadReservations();
                LoadClients();
            }
        }

        SQLiteConnection Conn()
        {
            return new SQLiteConnection("Data Source=" + DB + ";Version=3;");
        }

        void LoadReservations()
        {
            using (var c = Conn())
            {
                c.Open();
                var cmd = new SQLiteCommand("SELECT * FROM reservations", c);
                var t = new DataTable();
                t.Load(cmd.ExecuteReader());
                gvReservations.DataSource = t;
                gvReservations.DataBind();
            }
        }

        void LoadClients()
        {
            using (var c = Conn())
            {
                c.Open();
                var cmd = new SQLiteCommand("SELECT * FROM users", c);
                var t = new DataTable();
                t.Load(cmd.ExecuteReader());
                gvClients.DataSource = t;
                gvClients.DataBind();
            }
        }

        protected void btnCreateReservation_Click(object sender, EventArgs e)
        {
            using (var c = Conn())
            {
                c.Open();
                var cmd = new SQLiteCommand("INSERT INTO reservations(username, arrival, departure, room_type) VALUES(@u,@a,@d,@r)", c);
                cmd.Parameters.AddWithValue("@u", txtRUser.Text);
                cmd.Parameters.AddWithValue("@a", txtRArrival.Text);
                cmd.Parameters.AddWithValue("@d", txtRDeparture.Text);
                cmd.Parameters.AddWithValue("@r", txtRRoom.Text);
                cmd.ExecuteNonQuery();
            }
            LoadReservations();
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

            string user = (gvReservations.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            string arr = (gvReservations.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            string dep = (gvReservations.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            string room = (gvReservations.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;

            using (var c = Conn())
            {
                c.Open();
                var cmd = new SQLiteCommand(
                    "UPDATE reservations SET username=@u, arrival=@a, departure=@d, room_type=@r WHERE reservation_id=@id", c);
                cmd.Parameters.AddWithValue("@u", user);
                cmd.Parameters.AddWithValue("@a", arr);
                cmd.Parameters.AddWithValue("@d", dep);
                cmd.Parameters.AddWithValue("@r", room);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }

            gvReservations.EditIndex = -1;
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
            using (var c = Conn())
            {
                c.Open();
                var cmd = new SQLiteCommand(
                    "INSERT INTO users(username, password, profile, name, dob, address, mobile) VALUES(@u,@p,'client',@n,@d,@a,@m)", c);

                cmd.Parameters.AddWithValue("@u", txtCUsername.Text);
                cmd.Parameters.AddWithValue("@p", PasswordMD5.Hash(txtCPassword.Text));
                cmd.Parameters.AddWithValue("@n", txtCName.Text);
                cmd.Parameters.AddWithValue("@d", txtCDOB.Text);
                cmd.Parameters.AddWithValue("@a", txtCAddress.Text);
                cmd.Parameters.AddWithValue("@m", txtCMobile.Text);

                cmd.ExecuteNonQuery();
            }

            LoadClients();
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
            string user = gvClients.DataKeys[e.RowIndex].Value.ToString();

            string profile = (gvClients.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            string id = (gvClients.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            string name = (gvClients.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            string dob = (gvClients.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            string address = (gvClients.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
            string mobile = (gvClients.Rows[e.RowIndex].Cells[6].Controls[0] as TextBox).Text;

            using (var c = Conn())
            {
                c.Open();
                var cmd = new SQLiteCommand(
                    "UPDATE users SET profile=@p, id_number=@i, name=@n, dob=@d, address=@a, mobile=@m WHERE username=@u", c);

                cmd.Parameters.AddWithValue("@p", profile);
                cmd.Parameters.AddWithValue("@i", id);
                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@d", dob);
                cmd.Parameters.AddWithValue("@a", address);
                cmd.Parameters.AddWithValue("@m", mobile);
                cmd.Parameters.AddWithValue("@u", user);

                cmd.ExecuteNonQuery();
            }

            gvClients.EditIndex = -1;
            LoadClients();
        }

        protected void gvClients_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string user = gvClients.DataKeys[e.RowIndex].Value.ToString();

            using (var c = Conn())
            {
                c.Open();

                var cmd1 = new SQLiteCommand("DELETE FROM reservations WHERE username=@u", c);
                cmd1.Parameters.AddWithValue("@u", user);
                cmd1.ExecuteNonQuery();

                var cmd2 = new SQLiteCommand("DELETE FROM users WHERE username=@u", c);
                cmd2.Parameters.AddWithValue("@u", user);
                cmd2.ExecuteNonQuery();
            }

            LoadClients();
            LoadReservations();
        }
    }
}
