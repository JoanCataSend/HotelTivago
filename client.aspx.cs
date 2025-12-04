using System;
using System.Data;
using System.Data.SQLite;
using HotelTivago.Classes;

namespace HotelTivago.Pages
{
    public partial class client : System.Web.UI.Page
    {
        private DatabaseManager db;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "client")
            {
                Response.Redirect("login.aspx");
                return;
            }

            string dbPath = Server.MapPath("~/bbdd/hoteltrivago.db");
            db = new DatabaseManager(dbPath);

            if (!IsPostBack)
            {
                LoadClientInfo();
                LoadReservations();
            }
        }

        private void LoadClientInfo()
        {
            using (var c = db.GetConnection())
            {
                c.Open();

                var cmd = new SQLiteCommand("SELECT * FROM users WHERE username=@u", c);
                cmd.Parameters.AddWithValue("@u", Session["Username"]);

                DataTable t = new DataTable();
                t.Load(cmd.ExecuteReader());

                if (t.Rows.Count == 0)
                {
                    Response.Redirect("login.aspx");
                    return;
                }

                lblUsername.Text = t.Rows[0]["username"].ToString();
                lblName.Text = t.Rows[0]["name"].ToString();
                lblDOB.Text = t.Rows[0]["dob"].ToString();
                lblAddress.Text = t.Rows[0]["address"].ToString();
                lblMobile.Text = t.Rows[0]["mobile"].ToString();
            }
        }

        private void LoadReservations()
        {
            using (var c = db.GetConnection())
            {
                c.Open();

                var cmd = new SQLiteCommand(
                    "SELECT reservation_id, arrival, departure, room_type FROM reservations WHERE username=@u", c);

                cmd.Parameters.AddWithValue("@u", Session["Username"]);

                DataTable t = new DataTable();
                t.Load(cmd.ExecuteReader());

                gvClientReservations.DataSource = t;
                gvClientReservations.DataBind();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}
