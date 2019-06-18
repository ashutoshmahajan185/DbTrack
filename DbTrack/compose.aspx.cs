using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class compose : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Add_Click(object sender, EventArgs e)
    {


        for (int i = 0; i < ListBox1.Items.Count; i++)
        {
            if (ListBox1.Items[i].Selected)
            {
                ListBox2.Items.Add(ListBox1.Items[i]);
                ListBox1.Items.RemoveAt(i);
            }
        }
    }
    protected void AddAll_Click(object sender, EventArgs e)
    {
        while (ListBox1.Items.Count != 0)
        {
            for (int i = 0; i < ListBox1.Items.Count; i++)
            {

                ListBox2.Items.Add(ListBox1.Items[i]);
                ListBox1.Items.RemoveAt(i);
            }
        }
    }
    protected void Remove_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ListBox2.Items.Count; i++)
        {
            if (ListBox2.Items[i].Selected)
            {
                ListBox1.Items.Add(ListBox2.Items[i]);
                ListBox2.Items.RemoveAt(i);
            }
        }
    }
    protected void RemoveAll_Click(object sender, EventArgs e)
    {
        while (ListBox2.Items.Count != 0)
        {
            for (int i = 0; i < ListBox2.Items.Count; i++)
            {

                ListBox1.Items.Add(ListBox2.Items[i]);
                ListBox2.Items.RemoveAt(i);

            }
        }
    }
    protected void Send_Click(object sender, EventArgs e)
    {
        int count = ListBox2.Items.Count;
        if (count == 0)
        {
            lbltxt.Text = "Please Add Recipients.....";
        }

        String query = "";

        String un = Session["User_Name"].ToString();
        string time = DateTime.Now.ToShortTimeString();
        string date = DateTime.Now.ToShortDateString();


        try
        {

            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            if (ListBox2.Items.Count == 1)
            {
                query = "'" + ListBox2.Items[0] + "','" + un + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + date + "','" + time + "','false'";

                SqlCommand cmd = new SqlCommand("INSERT INTO Mail VALUES(" + query + ")", con);
                cmd.ExecuteNonQuery();


                Response.Write("<script>alert('Mail Succesfully Sent !')</script>");
                Response.Redirect("~/compose.aspx");
                query = "";

            }
            else
            {
                for (int i = 0; i < count; i++)
                {
                    query = "'" + ListBox2.Items[i] + "','" + un + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + date + "','" + time + "','false'";

                    SqlCommand cmd = new SqlCommand("INSERT INTO Mail VALUES(" + query + ")", con);
                    cmd.ExecuteNonQuery();


                    Response.Write("<script>alert('Mail Succesfully Sent !')</script>");
                    Response.Redirect("~/compose.aspx");
                    query = "";
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