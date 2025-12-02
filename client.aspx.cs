using System;
using System.Data;
using System.Data.SQLite;

namespace HotelTivago
{
    public partial class client : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadClientReservations();
        }

        void LoadClientReservations()
        {
            // SECURITY CHECK – If no user logged in, go to login
            if (Session["Username"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            string username = Session["Username"].ToString();
            string DBpath = Server.MapPath("~/bbdd/hoteltrivago.db");

            using (SQLiteConnection conn = new SQLiteConnection("Data Source=" + DBpath + ";Version=3;"))
            {
                conn.Open();

                using (SQLiteCommand cmd = new SQLiteCommand(
                    "SELECT reservation_id, arrival, departure, room_type FROM reservations WHERE username=@u", conn))
                {
                    cmd.Parameters.AddWithValue("@u", username);

                    DataTable table = new DataTable();
                    table.Load(cmd.ExecuteReader());

                    gvClientReservations.DataSource = table;
                    gvClientReservations.DataBind();
                }
            }
        }
    }
}
