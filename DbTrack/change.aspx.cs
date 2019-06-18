using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class change : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Send_Click(object sender, EventArgs e)
    {
        try
        {
            String user = Session["User_Name"].ToString();
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            Encryption enc = new Encryption(user, TextBox1.Text);
            String s1 = enc.Get_Encrypted_Value();
            string query = "Select * from Employee where User_Name = '" + user + "' and Password =  '" + s1 + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (TextBox2.Text.Length < 8)
                {
                    Label1.Text = "New Password can't be less then 8 characters";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                }
                else if (TextBox2.Text.Length > 12)
                {
                    Label1.Text = "New Password can't be more then 12 characters";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                }
                else if (TextBox1.Text.Equals(TextBox2.Text))
                {
                    Label1.Text = "Old and New Password can't be same";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                }
                else
                {
                    if (TextBox2.Text.Contains(user))
                    {
                        Label1.Text = "New Password can't contain username";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                    }
                    else if (!TextBox2.Text.Equals(TextBox3.Text))
                    {
                        Label1.Text = "These Passwords dosen't match";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                    }
                    else
                    {
                        enc = new Encryption(user, TextBox2.Text);
                        s1 = enc.Get_Encrypted_Value();
                        query = "Update Employee set Password='" + s1 + "' where User_Name='" + user + "'";
                        cmd = new SqlCommand(query, con);
                        cmd.ExecuteReader();
                        Label1.Text = "Password Updated";
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                    }
                }
            }
            else
            {
                Label1.Text = "Invalid Old Password";
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
            }
        }
        catch (Exception e1)
        {
        }
    }
    protected void Discard_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        Label1.Text = "";
    }
}