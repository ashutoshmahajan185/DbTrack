using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class verification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void OnClick_Insert(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        empid.Text = "";
        Ver_no.Text = "";
        Date.Text = "";
        disposal.Text = "";
        Status.Text = "";
    }
}