using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Text = "Message Recieved ";
            Label4.Text = Session["m_subject"].ToString();
            Label2.Text = Session["m_from"].ToString();
            Label3.Text = Session["m_date"].ToString() + "    " + Session["m_time"].ToString();
            Label5.Text = Session["m_content"].ToString();
            //this.BindGrid();
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            con.Open();

            SqlCommand cmd = new SqlCommand("UPDATE [Mail] SET [m_read] = 'true' Where m_to='" + Session["User_Name"] + "' AND m_subject= '" + Session["m_subject"] + "' AND m_content='" + Session["m_content"] + "' AND m_date='" + Session["m_date"] + "' AND m_time='" + Session["m_time"] + "'", con);

            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}