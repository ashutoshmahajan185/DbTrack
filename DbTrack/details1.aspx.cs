using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class details1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Text = "Message Sent ";
            Label4.Text = Session["m_subject"].ToString();
            Label2.Text = Session["m_to"].ToString();
            Label3.Text = Session["m_date"].ToString() + "    " + Session["m_time"].ToString();
            Label5.Text = Session["m_content"].ToString();
            //this.BindGrid();

        }
    }
}