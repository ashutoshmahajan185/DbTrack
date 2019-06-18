using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class task : System.Web.UI.Page
{
    public String alert;
    private static Alerts a;
    private static String case_type = "ALL";

    private void Generate_Alets()
    {
        case_type = DropDownList1.SelectedValue.ToString();
        String user = DropDownList2.SelectedValue.ToString();
        String no = DropDownList3.SelectedValue.ToString();
        if (user.Equals(""))
            user = Session["User_Name"].ToString();
        if (no.Equals(""))
            no = "-999";
        a = new Alerts(case_type, user);
        alert = a.Get_Alerts(no);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Generate_Alets();
        if (Session["Role"].Equals("user"))
        {
            DropDownList2.Visible = false;
            DropDownList3.Visible = false;
        }

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
                if (s2[1].Equals(""))
                    s.Append("RI No-" + s2[3] + " of type " + s2[2]);
                else
                    s.Append("Case No-" + s2[3] + " of type " + s2[2] + " in phase " + s2[1]);
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
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["ver"] = "alerts";
        Session["admin"] = "bk";
        Response.Redirect("~/adminlogin.aspx");
    }
}