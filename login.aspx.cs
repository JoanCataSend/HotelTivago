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

            using (SQLiteConnection conn = new SQLiteConnection("Data Source=" + DBpath + ";Version=3;"))
            {
                conn.Open();

                try
                {
                    using (SQLiteCommand cmd = new SQLiteCommand("SELECT profile, password FROM users WHERE username=@u", conn))
                    {
                        cmd.Parameters.AddWithValue("@u", txtUser.Text);

                        using (SQLiteDataReader r = cmd.ExecuteReader())
                        {
                            if (r.Read())
                            {
                                string role = r.GetString(0);
                                string storedPassword = r.GetString(1);

                                // Convertir password escrita a MD5
                                string md5Input = PasswordMD5.Hash(txtPass.Text);

                                if (storedPassword == md5Input)
                                {
                                    Session["Username"] = txtUser.Text;
                                    Session["Role"] = role;

                                    if (role == "receptionist")
                                    {
                                        Response.Redirect("receptionist.aspx");
                                        return;
                                    }

                                    if (role == "client")
                                    {
                                        Response.Redirect("client.aspx");
                                        return;
                                    }
                                }
                            }
                        }
                    }

                    lblError.Text = "Invalid username or password.";
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}
