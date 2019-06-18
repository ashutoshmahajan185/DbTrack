using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;

public partial class index : System.Web.UI.Page
{
    public String[] stats = new String[5];
    protected void Page_Load(object sender, EventArgs e)
    {
        Label3.Text = Session["User_Name"].ToString();

        DataTable o = CreateRecords();
        createPieChart(o);
        if (!this.IsPostBack)
        {
            this.BindGrid();
        }
        String role = Session["Role"].ToString();
        if (role.Equals("admin"))
        {
            GridView1.Visible = false;
        }
        else
        {
            GridView2.Visible = false;
            empid.Visible = false;
        }



    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        this.BindGrid();
    }
    private void BindGrid()
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {


    }
    DataTable CreateRecords()
    {
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        String role = Session["Role"].ToString();
        if (role.Equals("admin"))
        {
            cmd.CommandText = "Select Count(*) From [Case] Where Case_type='Trap'";
        }
        else
        {
            cmd.CommandText = "Select Count(*) From [Case] Where empid='" + Session["empid"] + "' and Case_type='Trap'";
        }
        cmd.Connection = con;
        Int32 count = (Int32)cmd.ExecuteScalar();

        DataTable o = new DataTable("Chart");
        o.Columns.Add("Emp_ID", typeof(String));
        o.Columns.Add("No_Cases", typeof(String));
        o.Columns.Add("Case_Type", typeof(String));

        DataRow e = o.NewRow();
        e["Emp_ID"] = Session["empid"];
        e["No_Cases"] = count;
        e["Case_Type"] = "Trap";
        o.Rows.Add(e);

        if (role.Equals("admin"))
        {
            cmd.CommandText = "Select Count(*) From [Case] Where Case_type='DPA'";
        }
        else
        {
            cmd.CommandText = "Select Count(*) From [Case] Where empid='" + Session["empid"] + "' and Case_type='DPA'";
        }
        cmd.Connection = con;
        count = (Int32)cmd.ExecuteScalar();

        e = o.NewRow();
        e["Emp_ID"] = Session["empid"];
        e["No_Cases"] = count;
        e["Case_Type"] = "DPA";
        o.Rows.Add(e);

        if (role.Equals("admin"))
        {
            cmd.CommandText = "Select Count(*) From [Case] Where Case_type='MC'";
        }
        else
        {
            cmd.CommandText = "Select Count(*) From [Case] Where empid='" + Session["empid"] + "' and Case_type='MC'";
        }
        cmd.Connection = con;
        count = (Int32)cmd.ExecuteScalar();

        e = o.NewRow();
        e["Emp_ID"] = Session["empid"];
        e["No_Cases"] = count;
        e["Case_Type"] = "MC";
        o.Rows.Add(e);

        if (role.Equals("admin"))
        {
            cmd.CommandText = "Select Count(*) From [Case] Where Case_type='OE'";
        }
        else
        {
            cmd.CommandText = "Select Count(*) From [Case] Where empid='" + Session["empid"] + "' and Case_type='OE'";
        }
        cmd.Connection = con;
        count = (Int32)cmd.ExecuteScalar();

        e = o.NewRow();
        e["Emp_ID"] = Session["empid"];
        e["No_Cases"] = count;
        e["Case_Type"] = "OE";
        o.Rows.Add(e);

        if (role.Equals("admin"))
        {
            cmd.CommandText = "Select Count(*) From [Case] Where Case_type='ED'";
        }
        else
        {
            cmd.CommandText = "Select Count(*) From [Case] Where empid='" + Session["empid"] + "' and Case_type='ED'";
        }
        cmd.Connection = con;
        count = (Int32)cmd.ExecuteScalar();

        e = o.NewRow();
        e["Emp_ID"] = Session["empid"];
        e["No_Cases"] = count;
        e["Case_Type"] = "ED";
        o.Rows.Add(e);

        return o;
    }
    void createPieChart(DataTable o)
    {
        foreach (DataRow e in o.Rows)
        {
            DataPoint f = new DataPoint(0, Double.Parse(e["No_Cases"].ToString()));
            f.ToolTip = e["Case_Type"].ToString();
            f.Label = e["Case_Type"].ToString() + " = " + e["No_Cases"].ToString();

            Chart1.Series[0].Points.Add(f);

        }
        Chart1.Series[0]["PointWidth"] = "0.1";
        Chart1.Series[0]["DrawingStyle"] = "Cylinder";
        Chart1.Series[0]["PieLabelStyle"] = "Inside";
        Chart1.ChartAreas["ChartArea1"].InnerPlotPosition.Width = 100;
        Chart1.ChartAreas["ChartArea1"].InnerPlotPosition.Height = 100;
        Chart1.ChartAreas["ChartArea1"].InnerPlotPosition.X = 0;
        Chart1.ChartAreas["ChartArea1"].InnerPlotPosition.Y = 0;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Case_no"] = GridView1.SelectedRow.Cells[0].Text;
        Session["Case_type"] = GridView1.SelectedRow.Cells[1].Text;
        Response.Redirect("~/ChartExample.aspx");
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Case_no"] = GridView2.SelectedRow.Cells[0].Text;
        Session["Case_type"] = GridView2.SelectedRow.Cells[1].Text;
        Response.Redirect("~/ChartExample.aspx");
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
    }
    protected void Button1_Click2(object sender, EventArgs e)
    {

    }
}