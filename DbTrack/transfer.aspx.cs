using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class transfer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String caseno = TextBox1.Text.ToString();
        String nempid = TextBox2.Text.ToString();
        String till = TextBox3.Text.ToString();

        try
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT empid FROM [Case] Where Case_no = '" + caseno + "'", con);
            String oempid = cmd.ExecuteScalar().ToString();
            // Label3.Text = oempid;
            if (oempid == nempid)
            {
                Label2.Text = "That User is currently assigned the same case.";
            }
            else
            {
                cmd = new SqlCommand("UPDATE [Case] SET empid = '" + nempid + "' Where Case_no = '" + caseno + "'", con);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("SELECT w_till FROM [Transfer] Where Case_no = '" + caseno + "' AND new_empid = '" + oempid + "' ORDER BY w_till DESC", con);
                String ntill = cmd.ExecuteScalar().ToString();

                cmd = new SqlCommand("UPDATE [Transfer] SET w_till = '" + till + "' where Case_no = '" + caseno + "' AND new_empid = '" + oempid + "'", con);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("INSERT INTO [Transfer] Values ('" + caseno + "','" + oempid + "','" + nempid + "','" + till + "','" + ntill + "' )", con);
                cmd.ExecuteNonQuery();


                Label2.Text = "Case is Transfered";
                con.Close();
                Clear();
            }

        }
        catch (Exception ex)
        {
            ex.ToString();
        }
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
    protected void Clear()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
    }
}