using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class notices : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            try
            {
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                con.Open();
                string query = "select top 2 Name,Sdate,Notice from Notice order by date DESC ";
                //date db datatype compulsory nvarchar as ntext cannot be sorted
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader dr = cmd.ExecuteReader();
                int count = 0;
                while (dr.Read())
                {
                    if (count == 0)
                    {
                        //Return last value only
                        Label2.Text = dr["Name"].ToString();
                        Label3.Text = dr["Sdate"].ToString();
                        Label4.Text = dr["Notice"].ToString();
                        count++;
                    }
                    else
                    {
                        Label5.Text = dr["Name"].ToString();
                        Label6.Text = dr["Sdate"].ToString();
                        Label7.Text = dr["Notice"].ToString();
                    }
                }

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

    }
    protected void Send_Click(object sender, EventArgs e)
    {

        if (TextBox3.Text != "")
        {
            try
            {
                String Sdate = DateTime.Today.ToLongDateString();
                String date = DateTime.UtcNow.ToString();
                String user = Session["User_Name"].ToString();
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand("INSERT INTO Notice VALUES('" + user + "','" + Sdate + "','" + TextBox3.Text + "','" + date + "')", con);

                con.Open();
                cmd.ExecuteNonQuery();


                con.Close();


                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "success", "alert('Notice Successfully Posted on the Wall !'); setInterval(function(){location.href='notices.aspx';},500);", true);

            }
            catch (Exception ex)
            {

                Response.Write(ex);
            }
        }
        else
        {
            Label1.Text = "*All Fields Required";
        }
    }



}