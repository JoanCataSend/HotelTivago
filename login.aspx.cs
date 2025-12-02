using System;
using System.Data;
using System.Data.SQLite;

namespace HotelTivago
{
    public partial class login : System.Web.UI.Page
    {
        string DB;

        protected void Page_Load(object sender, EventArgs e)
        {
            DB = Server.MapPath("~/bbdd/hoteltrivago.db");
        }

        SQLiteConnection Conn()
        {
            return new SQLiteConnection("Data Source=" + DB + ";Version=3;");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (var c = Conn())
            {
                c.Open();
                SQLiteCommand cmd = new SQLiteCommand(
                    "SELECT * FROM users WHERE username=@u AND password=@p", c);

                cmd.Parameters.AddWithValue("@u", txtUser.Text);
                cmd.Parameters.AddWithValue("@p", PasswordMD5.Hash(txtPass.Text));

                DataTable t = new DataTable();
                t.Load(cmd.ExecuteReader());

                if (t.Rows.Count == 0)
                {
                    lblError.Text = "Invalid credentials";
                    return;
                }

                string profile = t.Rows[0]["profile"].ToString();

                Session["Username"] = txtUser.Text;
                Session["Role"] = profile;

                if (profile == "receptionist")
                    Response.Redirect("receptionist.aspx");
                else
                    Response.Redirect("client.aspx");
            }
        }
    }
}
