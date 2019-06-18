using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin1 : System.Web.UI.Page
{

    public String s1 = "";

    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin2.aspx");
    }
    protected void Send_Click(object sender, EventArgs e)
    {
        try
        {

            string cs = " INSERT INTO [Case] VALUES ('" + TextBox1.Text + "','" + TextBox17.Text + "','" + DropDownList1.SelectedValue.ToString() + "','" + TextBox11.Text + "')";
            String sel = DropDownList1.SelectedValue.ToString();
            Session["que"] = cs;
            Session["assign"] = sel;
            Session["case"] = TextBox1.Text;
            Session["eid"] = TextBox17.Text;
            Response.Redirect("~/assign.aspx");
        }
        catch (Exception ex)
        {

            Response.Write(ex);
        }
        

    }
    protected void Discard_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin1.aspx");
    }

    protected void Button6_Click1(object sender, EventArgs e)
    {
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}