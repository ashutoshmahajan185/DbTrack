using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class transferAV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox3.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String casetype = DropDownList1.SelectedValue;
        String rino = TextBox1.Text.ToString();
        String tdate = TextBox3.Text.ToString();
        String nempid = TextBox2.Text.ToString();

        try
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT empid FROM " + DropDownList1.SelectedValue + "  Where RI_no = '" + rino + "'", con);
            String oempid = cmd.ExecuteScalar().ToString();

            if (oempid == nempid)
            {
                Label2.Text = "That User is currently assigned the same case.";
            }
            else
            {
                cmd = new SqlCommand("Insert Into [TransferAV] Values ('" + rino + "','" + casetype + "','" + oempid + "','" + tdate + "' )", con);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE " + DropDownList1.SelectedValue + " SET empid='" + nempid + "' WHERE RI_no='" + rino + "'", con);
                cmd.ExecuteNonQuery();
                Label2.Text = "Case is Transfered";
                con.Close();
                Response.Redirect("~/transferAV.aspx");
            }

        }
        catch (Exception ex)
        {
            ex.ToString();
        }

    }
}