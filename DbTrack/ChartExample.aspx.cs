using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;


public partial class ChartExample : System.Web.UI.Page
{
    public String[] x;
    public int[] y;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label3.Text = Session["User_Name"].ToString();
            String Case_type = Session["Case_type"].ToString();
            String Case_no = Session["Case_no"].ToString();
            DataTable dt = new DataTable();
            String cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("select * from " + Case_type + " where Case_no = '" + Case_no + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }

            x = new String[dt.Columns.Count - 4];
            y = new int[dt.Columns.Count - 4];
            int ycount = 100;
            if (Case_type.Equals("Trap") || Case_type.Equals("DPA") || Case_type.Equals("MC"))
                for (int i = 0, j = 2; j < 18; j++, i++)
                {
                    y[i] = ycount;
                    ycount = ycount + 10;
                    x[i] = dt.Rows[0][j].ToString();
                }
            else
            {
                if (Case_type.Equals("ED"))
                    for (int i = 0, j = 2; j < 16; j++, i++)
                    {
                        y[i] = ycount;
                        ycount = ycount + 10;
                        x[i] = dt.Rows[0][j].ToString();
                    }
                else
                    for (int i = 0, j = 2; j < 14; j++, i++)
                    {
                        y[i] = ycount;
                        ycount = ycount + 10;
                        x[i] = dt.Rows[0][j].ToString();
                    }
            }

            for (int i = 0; i < x.Length; i++)
            {
                DataPoint f = new DataPoint(0, y[i]);
                f.ToolTip = x[i];
                Chart1.Series[0].Points.Add(f);
            }
            Chart1.ChartAreas["ChartArea1"].AxisX.Interval = 1;
            Chart1.Series[0]["PointWidth"] = (0.5).ToString();

            Chart1.Series[0].Points.DataBindXY(x, y);
            Chart1.ChartAreas["ChartArea1"].AxisY.LabelStyle.Enabled = false;
            Chart1.ChartAreas["ChartArea1"].AxisX.LabelAutoFitStyle = LabelAutoFitStyles.None;
            Chart1.ChartAreas["ChartArea1"].AxisX.LabelStyle.Font = new System.Drawing.Font("Trebuchet MS", 9.0F, System.Drawing.FontStyle.Bold);
            Label2.Text = "Case No :    " + Case_no + "\n";
            Label4.Text = "Case Type :  " + Case_type + "\n";
        }
    }
}
