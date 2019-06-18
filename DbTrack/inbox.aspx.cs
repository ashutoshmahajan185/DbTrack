using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

public partial class inbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

        }
    }


    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;


    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Text = Regex.Replace(e.Row.Cells[0].Text, TextBox4.Text.Trim(), delegate(Match match)
            {
                return string.Format("<span style = 'background-color:#B3E5FC'>{0}</span>", match.Value);
            }, RegexOptions.IgnoreCase);
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["m_from"] = GridView1.SelectedRow.Cells[0].Text;
        Session["m_subject"] = GridView1.SelectedRow.Cells[1].Text;
        Session["m_content"] = GridView1.SelectedRow.Cells[2].Text;
        Session["m_date"] = GridView1.SelectedRow.Cells[3].Text;
        Session["m_time"] = GridView1.SelectedRow.Cells[4].Text;

        Response.Redirect("~/details.aspx");
    }
    private void BindGridSearch()
    {


        String un = Session["User_Name"].ToString();
        string db = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(db))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT m_from,m_subject,m_date,m_time,m_read FROM Mail WHERE m_to='" + un + "'";

                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@m_to", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@m_subject", TextBox4.Text.Trim());
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);

                }
            }

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/message.aspx");
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/compose.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}