using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reports : System.Web.UI.Page
{
    static String s = "Overall";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Report_Load(object sender, EventArgs e)
    {
        String role = Session["Role"].ToString();
        ReportViewer1.Width = 800;
        ReportViewer1.Height = 600;
        ReportViewer1.ProcessingMode = ProcessingMode.Remote;
        ReportViewer1.ServerReport.ReportServerUrl = new Uri("http://HEMANG-PC:80/ReportServer/");
        ReportViewer1.ServerReport.ReportPath = "/ACB Reports/" + s;
        if (!role.Equals("admin"))
        {
            Button1.Visible = false;
            DropDownList1.Visible = false;
        }
        ReportViewer1.ServerReport.Refresh();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        s = DropDownList1.Text;
        Report_Load(sender, e);
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}