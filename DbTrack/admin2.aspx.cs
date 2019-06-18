using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin2 : System.Web.UI.Page
{
    public String table = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/update.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin1.aspx");
    }

    protected void OnClick_Insert(object sender, EventArgs e)
    {
        if (Password.Text.Length < 8)
        {
            Label2.Text = "Password can't be less then 8 character";
            Password.Text = "";
        }
        else if (Password.Text.Length > 12)
        {
            Label2.Text = "Password can't be more then 12 character";
            Password.Text = "";
        }
        else if (Password.Text.Contains(User_Name.Text))
        {
            Label2.Text = "Password can't contain User Name";
            Password.Text = "";
        }
        else
        {
            Encryption enc = new Encryption(User_Name.Text, Password.Text);
            Password.Text = enc.Get_Encrypted_Value();
            SqlDataSource1.Insert();
            empid.Text = "";
            User_Name.Text = "";
            Password.Text = "";
            Designation.Text = "";
            Role.Text = "";
            Label2.Text = "User Created";
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        table = DropDownList1.Text;

        if (table.Equals("Employee"))
        {

            GridView1.Visible = true;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = false;
            GridView5.Visible = false;
            GridView6.Visible = false;
            GridView7.Visible = false;
        }
        if (table.Equals("Case"))
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
            GridView4.Visible = false;
            GridView5.Visible = false;
            GridView6.Visible = false;
            GridView7.Visible = false;
        }
        if (table.Equals("Trap"))
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = true;
            GridView4.Visible = false;
            GridView5.Visible = false;
            GridView6.Visible = false;
            GridView7.Visible = false;
        }
        if (table.Equals("DPA"))
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = true;
            GridView5.Visible = false;
            GridView6.Visible = false;
            GridView7.Visible = false;
        }
        if (table.Equals("MC"))
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = false;
            GridView5.Visible = true;
            GridView6.Visible = false;
            GridView7.Visible = false;
        }
        if (table.Equals("OE"))
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = false;
            GridView5.Visible = false;
            GridView6.Visible = true;
            GridView7.Visible = false;
        }
        if (table.Equals("ED"))
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = false;
            GridView5.Visible = false;
            GridView6.Visible = false;
            GridView7.Visible = true;
        }
        if (table.Equals("Application"))
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = false;
            GridView5.Visible = false;
            GridView6.Visible = false;
            GridView7.Visible = false;
        }
    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/transfer.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/transferAV.aspx");
    }
    protected void SqlDataSource7_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}