using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class forgot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                con.Open();

                string query = "Select * from Employee where User_Name = '" + TextBox1.Text + "' and Password =  '" + TextBox2.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Encryption enc = new Encryption(TextBox1.Text, TextBox2.Text, 0);
                    String s = enc.Get_Decrypted_Value();
                    StringBuilder s1 = new StringBuilder();
                    s1.Append("<h4> Password: <b><i><u>");
                    s1.Append(s);
                    s1.Append("</u></i></b></h4>");
                    PlaceHolder1.Controls.Add(new Literal { Text = s1.ToString() });
                    Button1.Visible = false;
                }
                else
                {
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    Label1.Text = "Incorrect Username or Encrypted Password";
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}