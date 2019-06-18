using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class login : System.Web.UI.Page
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
                Encryption enc = new Encryption(TextBox1.Text, TextBox2.Text);
                String s1 = enc.Get_Encrypted_Value();
                string query = "Select * from Employee where User_Name = '" + TextBox1.Text + "' and Password =  '" + s1 + "'";
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session["User_Name"] = TextBox1.Text;
                    Session["empid"] = dt.Rows[0][0].ToString();
                    Session["Role"] = dt.Rows[0][dt.Columns.Count - 1].ToString();
                    if (Session["Role"].ToString().Equals("admin"))
                    {
                        Session["sidebar"] = "sidebar.aspx";
                    }
                    else
                    {
                        Session["sidebar"] = "sidebar1.aspx";
                    }
                    Session["admin"] = "";
                    Session["ver"] = "ver";
                    Response.Redirect("~/index.aspx");
                }
                else
                {
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    Label1.Text = "Incorrect Username or Password";
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}