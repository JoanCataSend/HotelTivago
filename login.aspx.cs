using System;
using System.Data;
using System.Data.SQLite;
using HotelTivago.Classes;

namespace HotelTivago.Pages
{
    public partial class login : System.Web.UI.Page
    {
        private DatabaseManager db;

        protected void Page_Load(object sender, EventArgs e)
        {
            string dbPath = Server.MapPath("~/bbdd/hoteltrivago.db");
            db = new DatabaseManager(dbPath);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblError.Text = "";

            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            if (username == "" || password == "")
            {
                lblError.Text = "Please enter username and password.";
                return;
            }

            using (var c = db.GetConnection())
            {
                c.Open();

                SQLiteCommand cmd = new SQLiteCommand(
                    "SELECT username, profile, password FROM users WHERE username=@u", c);

                cmd.Parameters.AddWithValue("@u", username);

                DataTable t = new DataTable();
                t.Load(cmd.ExecuteReader());

                if (t.Rows.Count == 0)
                {
                    lblError.Text = "Invalid username or password.";
                    return;
                }

                string storedHash = t.Rows[0]["password"].ToString();
                string enteredHash = PasswordMD5.Hash(password);

                if (!storedHash.Equals(enteredHash, StringComparison.OrdinalIgnoreCase))
                {
                    lblError.Text = "Invalid username or password.";
                    return;
                }

                string profile = t.Rows[0]["profile"].ToString();

                Session["Username"] = username;
                Session["Role"] = profile;

                if (profile == "receptionist")
                    Response.Redirect("receptionist.aspx");
                else
                    Response.Redirect("client.aspx");
            }
        }
    }
}
