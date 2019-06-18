using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;//important

public partial class message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {

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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/inbox.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["m_to"] = GridView1.SelectedRow.Cells[0].Text;
        Session["m_subject"] = GridView1.SelectedRow.Cells[1].Text;
        Session["m_content"] = GridView1.SelectedRow.Cells[2].Text;
        Session["m_date"] = GridView1.SelectedRow.Cells[3].Text;
        Session["m_time"] = GridView1.SelectedRow.Cells[4].Text;

        Response.Redirect("~/details1.aspx");
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/compose.aspx");
    }
}