using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;

public partial class update : System.Web.UI.Page
{
    public string list;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin1.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin2.aspx");
    }
    protected void Send_Click(object sender, EventArgs e)
    {
        try
        {

            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);


            SqlCommand cmd = new SqlCommand(" INSERT INTO " + DropDownList1.SelectedValue + " VALUES ('" + TextBox15.Text + "','" + TextBox16.Text + "','" + TextBox19.Text + "','" + TextBox20.Text + "','" + TextBox11.Text + "','" + TextBox21.Text + "','" + TextBox22.Text + "','" + TextBox23.Text + "','" + TextBox24.Text + "','" + TextBox1.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();


            con.Close();
            Label1.Text = "Case Registered Successfully";
            Response.Redirect("~/update.aspx");
        }
        catch (Exception ex)
        {

            Response.Write(ex);
        }
    }
    protected void Discard_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/update.aspx");
    }
}