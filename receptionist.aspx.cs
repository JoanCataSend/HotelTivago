using System;
using System.Data;
using System.Data.SQLite;
using System.Web.UI.WebControls;

namespace HotelTivago
{
    public partial class receptionist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadReservations();
        }

        void LoadReservations(string filterUser = null)
        {
            string DBpath = Server.MapPath("~/bbdd/hoteltrivago.db");

            using (SQLiteConnection conn = new SQLiteConnection("Data Source=" + DBpath + ";Version=3;"))
            {
                conn.Open();

                string query = "SELECT * FROM reservations";
                if (!string.IsNullOrWhiteSpace(filterUser))
                    query += " WHERE username LIKE @u";

                using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
                {
                    if (!string.IsNullOrWhiteSpace(filterUser))
                        cmd.Parameters.AddWithValue("@u", "%" + filterUser + "%");

                    DataTable table = new DataTable();
                    table.Load(cmd.ExecuteReader());

                    gvReservations.DataSource = table;
                    gvReservations.DataBind();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadReservations(txtSearchUser.Text);
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string DBpath = Server.MapPath("~/bbdd/hoteltrivago.db");

            using (SQLiteConnection conn = new SQLiteConnection("Data Source=" + DBpath + ";Version=3;"))
            {
                conn.Open();

                using (SQLiteCommand cmd = new SQLiteCommand(
                    "INSERT INTO reservations(username, arrival, departure, room_type) VALUES(@u, @a, @d, @r)", conn))
                {
                    cmd.Parameters.AddWithValue("@u", txtNewUsername.Text);
                    cmd.Parameters.AddWithValue("@a", txtNewArrival.Text);   // ← ARREGLADO
                    cmd.Parameters.AddWithValue("@d", txtNewDeparture.Text);
                    cmd.Parameters.AddWithValue("@r", txtNewRoom.Text);

                    cmd.ExecuteNonQuery();
                }
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

            string username = (gvReservations.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            string arrival = (gvReservations.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            string departure = (gvReservations.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            string room = (gvReservations.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;

            string DBpath = Server.MapPath("~/bbdd/hoteltrivago.db");

            using (SQLiteConnection conn = new SQLiteConnection("Data Source=" + DBpath + ";Version=3;"))
            {
                conn.Open();

                using (SQLiteCommand cmd = new SQLiteCommand(
                    "UPDATE reservations SET username=@u, arrival=@a, departure=@d, room_type=@r WHERE reservation_id=@id", conn))
                {
                    cmd.Parameters.AddWithValue("@u", username);
                    cmd.Parameters.AddWithValue("@a", arrival);
                    cmd.Parameters.AddWithValue("@d", departure);
                    cmd.Parameters.AddWithValue("@r", room);
                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.ExecuteNonQuery();
                }
            }

            gvReservations.EditIndex = -1;
            LoadReservations();
        }

        protected void gvReservations_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvReservations.DataKeys[e.RowIndex].Value);

            string DBpath = Server.MapPath("~/bbdd/hoteltrivago.db");

            using (SQLiteConnection conn = new SQLiteConnection("Data Source=" + DBpath + ";Version=3;"))
            {
                conn.Open();

                using (SQLiteCommand cmd = new SQLiteCommand("DELETE FROM reservations WHERE reservation_id=@id", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                }
            }

            LoadReservations();
        }
    }
}
