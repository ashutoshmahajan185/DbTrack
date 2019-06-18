using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class assign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand(Session["que"].ToString(), con);
        con.Open();
        cmd.ExecuteNonQuery();
        String sel = Session["assign"].ToString();
        if (sel == "Trap")
            InsertTrap();
        else
        {
            if (sel == "DPA")
                InsertDPA();
            else
            {
                if (sel == "MC")
                    InsertMC();
                else
                    if (sel == "OE")
                        InsertOE();
                    else
                        if (sel == "ED")
                            InsertED();
            }
        }

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox2.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }
    protected void Discard_Click(object sender, EventArgs e)
    {
        TextBox2.Text = "";
        TextBox3.Text = "";
    }
    protected void InsertTrap()
    {
        if (TextBox2.Text != "")
        {
            try
            {
                DateTime endDate = Convert.ToDateTime(this.TextBox2.Text);

                string reg = TextBox2.Text;
                string[] sd = new string[8];
                string[] ed = new string[8];
                string[] ad = new string[] { "45", "8", "2", "2", "15", "18", "90", "15" };
                endDate = endDate.AddDays(Convert.ToInt64("1"));
                sd[0] = endDate.ToShortDateString();
                for (int i = 0; i < 8; i++)
                {
                    endDate = endDate.AddDays(Convert.ToInt64(ad[i]));
                    ed[i] = endDate.ToShortDateString();
                    endDate = endDate.AddDays(Convert.ToInt64("1"));
                    if (i != 7)
                        sd[i + 1] = endDate.ToShortDateString();
                }


                String query = @"'" + Session["case"].ToString() + "'," + "'" + reg + "',";

                for (int i = 0; i < 8; i++)
                {
                    query = query + @" '" + sd[i] + "','" + ed[i] + "' ";

                    query = query + ",";
                }
                string remark = "";
                if (TextBox3.Text != "")
                {
                    remark = TextBox3.Text;
                }
                else
                {
                    remark = "No Remarks";
                }
                query = query + "'" + remark + "','pending','0'";
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand("INSERT INTO Trap VALUES(" + query + ")", con);
                // date in db should be of datatype nvarchar(MAX) 
                //   else error in some dates
                con.Open();
                cmd.ExecuteNonQuery();
                String snu = "";
                cmd = new SqlCommand("INSERT INTO [Transfer] VALUES ('" + Session["case"].ToString() + "', '" + snu + "','" + Session["eid"].ToString() + "','" + sd[0] + "','" + ed[7] + "' )", con);
                cmd.ExecuteNonQuery();
                 
                con.Close();

                Label1.Text="Case Successfully Registered !";
                Response.Redirect("admin1.aspx");
            }
            catch (Exception ex)
            {
                Label1.Text = "PLEASE ENTER A VALID DATE";
                Response.Write(ex);
            }
        }
        else
        {
            Label1.Text = "*Date Fields Required";
        }
    }
    protected void InsertDPA()
    {
        if (TextBox2.Text != "")
        {
            try
            {
                DateTime endDate = Convert.ToDateTime(this.TextBox2.Text);

                string reg = TextBox2.Text;
                string[] sd = new string[8];
                string[] ed = new string[8];
                string[] ad = new string[] { "110", "15", "5", "5", "15", "30", "90", "15" };
                endDate = endDate.AddDays(Convert.ToInt64("1"));
                sd[0] = endDate.ToShortDateString();
                for (int i = 0; i < 8; i++)
                {
                    endDate = endDate.AddDays(Convert.ToInt64(ad[i]));
                    ed[i] = endDate.ToShortDateString();
                    endDate = endDate.AddDays(Convert.ToInt64("1"));
                    if (i != 7)
                        sd[i + 1] = endDate.ToShortDateString();
                }


                String query = @"'" + Session["case"].ToString() + "'," + "'" + reg + "',";

                for (int i = 0; i < 8; i++)
                {
                    query = query + @" '" + sd[i] + "','" + ed[i] + "' ";

                    query = query + ",";
                }
                string remark = "";
                if (TextBox3.Text != "")
                {
                    remark = TextBox3.Text;
                }
                else
                {
                    remark = "No Remarks";
                }
                query = query + "'" + remark + "','pending','0'";
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand("INSERT INTO DPA VALUES(" + query + ")", con);
                // date in db should be of datatype nvarchar(MAX) 
                //   else error in some dates
                con.Open();
                cmd.ExecuteNonQuery();
                String snu = "";
                cmd = new SqlCommand("INSERT INTO [Transfer] VALUES ('" + Session["case"].ToString() + "', '" + snu + "','" + Session["eid"].ToString() + "','" + sd[0] + "','" + ed[7] + "' )", con);
                cmd.ExecuteNonQuery();

                con.Close();

                Label1.Text = "Case Successfully Registered !";
                Response.Redirect("admin1.aspx");

            }
            catch (Exception ex)
            {
                Label1.Text = "PLEASE ENTER A VALID DATE";
                Response.Write(ex);
            }
        }
        else
        {
            Label1.Text = "*Date Fields Required";
        }
    }
    protected void InsertMC()
    {
        if (TextBox2.Text != "")
        {
            try
            {
                DateTime endDate = Convert.ToDateTime(this.TextBox2.Text);

                string reg = TextBox2.Text;
                string[] sd = new string[8];
                string[] ed = new string[8];
                string[] ad = new string[] { "110", "15", "5", "5", "15", "30", "90", "15" };
                endDate = endDate.AddDays(Convert.ToInt64("1"));
                sd[0] = endDate.ToShortDateString();
                for (int i = 0; i < 8; i++)
                {
                    endDate = endDate.AddDays(Convert.ToInt64(ad[i]));
                    ed[i] = endDate.ToShortDateString();
                    endDate = endDate.AddDays(Convert.ToInt64("1"));
                    if (i != 7)
                        sd[i + 1] = endDate.ToShortDateString();
                }


                String query = @"'" + Session["case"].ToString() + "'," + "'" + reg + "',";

                for (int i = 0; i < 8; i++)
                {
                    query = query + @" '" + sd[i] + "','" + ed[i] + "' ";

                    query = query + ",";
                }
                string remark = "";
                if (TextBox2.Text != "")
                {
                    remark = TextBox2.Text;
                }
                else
                {
                    remark = "No Remarks";
                }
                query = query + "'" + remark + "','pending','0'";
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand("INSERT INTO MC VALUES(" + query + ")", con);
                // date in db should be of datatype nvarchar(MAX) 
                //   else error in some dates
                con.Open();
                cmd.ExecuteNonQuery();
                String snu = "";
                cmd = new SqlCommand("INSERT INTO [Transfer] VALUES ('" + Session["case"].ToString() + "', '" + snu + "','" + Session["eid"].ToString() + "','" + sd[0] + "','" + ed[7] + "' )", con);
                cmd.ExecuteNonQuery();

                con.Close();

                Label1.Text = "Case Successfully Registered !";
                Response.Redirect("admin1.aspx");

            }
            catch (Exception ex)
            {
                Label1.Text = "PLEASE ENTER A VALID DATE";
                Response.Write(ex);
            }
        }
        else
        {
            Label1.Text = "*Date Fields Required";
        }
    }
    protected void InsertOE()
    {
        if (TextBox2.Text != "")
        {
            try
            {
                DateTime endDate = Convert.ToDateTime(this.TextBox2.Text);

                string reg = TextBox2.Text;
                string[] sd = new string[6];
                string[] ed = new string[6];
                string[] ad = new string[] { "110", "15", "5", "5", "15", "30" };
                endDate = endDate.AddDays(Convert.ToInt64("1"));
                sd[0] = endDate.ToShortDateString();
                for (int i = 0; i < 6; i++)
                {
                    endDate = endDate.AddDays(Convert.ToInt64(ad[i]));
                    ed[i] = endDate.ToShortDateString();
                    endDate = endDate.AddDays(Convert.ToInt64("1"));
                    if (i != 5)
                        sd[i + 1] = endDate.ToShortDateString();
                }


                String query = @"'" + Session["case"].ToString() + "'," + "'" + reg + "',";

                for (int i = 0; i < 6; i++)
                {
                    query = query + @" '" + sd[i] + "','" + ed[i] + "' ";

                    query = query + ",";
                }
                string remark = "";
                if (TextBox3.Text != "")
                {
                    remark = TextBox3.Text;
                }
                else
                {
                    remark = "No Remarks";
                }
                query = query + "'" + remark + "','pending','0'";
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand("INSERT INTO OE VALUES(" + query + ")", con);
                // date in db should be of datatype nvarchar(MAX) 
                //   else error in some dates
                con.Open();
                cmd.ExecuteNonQuery();
                String snu = "";
                cmd = new SqlCommand("INSERT INTO [Transfer] VALUES ('" + Session["case"].ToString() + "', '" + snu + "','" + Session["eid"].ToString() + "','" + sd[0] + "','" + ed[5] + "' )", con);
                cmd.ExecuteNonQuery();

                con.Close();

                Label1.Text = "Case Successfully Registered !";
                Response.Redirect("admin1.aspx");

            }
            catch (Exception ex)
            {
                Label1.Text = "PLEASE ENTER A VALID DATE";
                Response.Write(ex);
            }
        }
        else
        {
            Label1.Text = "*Date Fields Required";
        }
    }
    protected void InsertED()
    {
        if (TextBox2.Text != "")
        {
            try
            {
                DateTime endDate = Convert.ToDateTime(this.TextBox2.Text);

                string reg = TextBox2.Text;
                string[] sd = new string[7];
                string[] ed = new string[7];
                string[] ad = new string[] { "30", "8", "2", "5", "15", "30", "90" };
                endDate = endDate.AddDays(Convert.ToInt64("1"));
                sd[0] = endDate.ToShortDateString();
                for (int i = 0; i < 7; i++)
                {
                    endDate = endDate.AddDays(Convert.ToInt64(ad[i]));
                    ed[i] = endDate.ToShortDateString();
                    endDate = endDate.AddDays(Convert.ToInt64("1"));
                    if (i != 6)
                        sd[i + 1] = endDate.ToShortDateString();
                }


                String query = @"'" + Session["case"].ToString() + "'," + "'" + reg + "',";

                for (int i = 0; i < 7; i++)
                {
                    query = query + @" '" + sd[i] + "','" + ed[i] + "' ";

                    query = query + ",";
                }
                string remark = "";
                if (TextBox3.Text != "")
                {
                    remark = TextBox3.Text;
                }
                else
                {
                    remark = "No Remarks";
                }
                query = query + "'" + remark + "','pending','0'";
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand("INSERT INTO ED VALUES(" + query + ")", con);
                // date in db should be of datatype nvarchar(MAX) 
                //   else error in some dates
                con.Open();
                cmd.ExecuteNonQuery();
                String snu = "";
                cmd = new SqlCommand("INSERT INTO [Transfer] VALUES ('" + Session["case"].ToString() + "', '" + snu + "','" + Session["eid"].ToString() + "','" + sd[0] + "','" + ed[6] + "' )", con);
                cmd.ExecuteNonQuery();

                con.Close();

                Label1.Text = "Case Successfully Registered !";
                Response.Redirect("admin1.aspx");

            }
            catch (Exception ex)
            {
                Label1.Text = "PLEASE ENTER A VALID DATE";
                Response.Write(ex);
            }
        }
        else
        {
            Label1.Text = "*Date Fields Required";
        }
    }
}