using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "bk" && TextBox2.Text == "bk")
        {
            if(Session["ver"].Equals("alerts"))
            Response.Redirect("~/admin_alerts.aspx");
            else if(Session["ver"].Equals("ver"))
            Response.Redirect("~/verification.aspx");
            else
            Response.Redirect("~/index.aspx");
        }
        else
        {
            Label1.Text = "Invalid Credientals";
        }
    }
}