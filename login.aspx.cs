using System;
using System.Data.SQLite;

namespace HotelTivago
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string DBpath = Server.MapPath("~/bbdd/hoteltrivago.db");

            SQLiteConnection conn = new SQLiteConnection("Data Source=" + DBpath + ";Version=3;");
            conn.Open();

            try
            {
                SQLiteCommand cmd = new SQLiteCommand("SELECT profile, password FROM users WHERE username=@u", conn);
                cmd.Parameters.AddWithValue("@u", txtUser.Text);

                SQLiteDataReader r = cmd.ExecuteReader();

                bool loginCorrecto = false;

                if (r.Read())
                {
                    string role = r.GetString(0);
                    string storedPassword = r.GetString(1);

                    if (storedPassword == txtPass.Text)
                    {
                        loginCorrecto = true;

                        Session["Username"] = txtUser.Text;
                        Session["Role"] = role;

                        if (role == "receptionist")
                        {
                            Response.Redirect("receptionist.aspx");
                        }

                        if (role == "client")
                        {
                            Response.Redirect("client.aspx");
                        }
                    }
                }

                r.Close();

                if (!loginCorrecto)
                {
                    lblError.Text = "Invalid username or password.";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
            }

            conn.Close();
        }
    }
}