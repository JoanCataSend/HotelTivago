using System;
using System.Data;
using System.Data.SQLite;

namespace HotelTivago
{
    public partial class client : System.Web.UI.Page
    {
        string DB;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "client")
            {
                Response.Redirect("login.aspx");
                return;
            }

            DB = Server.MapPath("~/bbdd/hoteltrivago.db");

            if (!IsPostBack)
            {
                LoadClientInfo();
                LoadReservations();
            }
        }

        SQLiteConnection Conn()
        {
            return new SQLiteConnection("Data Source=" + DB + ";Version=3;");
        }

        void LoadClientInfo()
        {
            using (var c = Conn())
            {
                c.Open();

                var cmd = new SQLiteCommand("SELECT * FROM users WHERE username=@u", c);
                cmd.Parameters.AddWithValue("@u", Session["Username"].ToString());

                DataTable t = new DataTable();
                t.Load(cmd.ExecuteReader());

                lblUsername.Text = t.Rows[0]["username"].ToString();
                lblID.Text = t.Rows[0]["id_number"].ToString();
                lblName.Text = t.Rows[0]["name"].ToString();
                lblDOB.Text = t.Rows[0]["dob"].ToString();
                lblAddress.Text = t.Rows[0]["address"].ToString();
                lblMobile.Text = t.Rows[0]["mobile"].ToString();
            }
        }

        void LoadReservations()
        {
            using (var c = Conn())
            {
                c.Open();
                var cmd = new SQLiteCommand("SELECT reservation_id, arrival, departure, room_type FROM reservations WHERE username=@u", c);
                cmd.Parameters.AddWithValue("@u", Session["Username"].ToString());

                DataTable t = new DataTable();
                t.Load(cmd.ExecuteReader());

                gvClientReservations.DataSource = t;
                gvClientReservations.DataBind();
            }
        }
    }
}
