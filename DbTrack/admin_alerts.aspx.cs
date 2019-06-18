using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_alerts : System.Web.UI.Page
{
    public String alert;
    private static Alerts a;
    private static String case_type = "Verification_Admin";

    private void Generate_Alets()
    {
        String user = Session["User_Name"].ToString(); ;
        a = new Alerts(case_type, user);
        String no = DropDownList4.SelectedValue.ToString();
        if (no.Equals(""))
            no = "-999";
        alert = a.Get_Alerts(no);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"].Equals("bk"))
        {

            Generate_Alets();
            StringBuilder s = new StringBuilder();
            if (alert.Equals(""))
            {
                s.Append("<tr>");
                s.Append("<td></i></td>");
                s.Append("<td></td>");
                s.Append("<td>");
                s.Append("No Tasks");
                s.Append("</td>");
                s.Append("<td></td>");
                s.Append("</tr>");
            }
            else
            {
                String[] s1 = alert.Split('#');
                for (int i = 0; i < 15 && i < s1.Length - 1; i++)
                {
                    String[] s2 = s1[i].Split('$');
                    s.Append("<tr class='Task'>");
                    s.Append("<td class='cell-icon1'><i class='icon-checker'></i></td>");
                    s.Append("<td>");
                    s.Append("Version No-" + s2[3] + " of type " + s2[2]);
                    s.Append("</td>");
                    s.Append("<td>");
                    s.Append(s2[4]);
                    s.Append("</td>");
                    s.Append("<td class='cell-status hidden-phone hidden-tablet'><b class='due'>");
                    s.Append(s2[0]);
                    s.Append("</b></td>");
                }

            }
            PlaceHolder1.Controls.Add(new Literal { Text = s.ToString() });
        }
        else
        {
            Response.Redirect("~/task.aspx");
        }
    }

    protected void alerts_Click(object sender, EventArgs e)
    {
        Session["admin"] = "";
        Response.Redirect("~/task.aspx");
    }
}