using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
public class Alerts
{
    private String Case_Type { set; get; }
    private String username { set; get; }
    private DateTime System_Date { set; get; }
    private SqlConnection con { set; get; }
    private DataTable dt { set; get; }
    private List<Case_Details> details { set; get; }
    public String query { set; get; }
    public Alerts(String ca,String user)
    {
        Case_Type = ca;
        username = user;
        System_Date = new DateTime(Int32.Parse(DateTime.Now.Year.ToString()),Int32.Parse(DateTime.Now.Month.ToString()),Int32.Parse(DateTime.Now.Day.ToString()) );
        details = new List<Case_Details>();
    }
    private void Connect_Database()
    {
        String cs = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
        con = new SqlConnection(cs);
        con.Open();
    }
    private Boolean Execute_Query()
    {
        Boolean b = false;
        if (Case_Type.Equals("Application") || Case_Type.Equals("Verification"))
        {
            query = "Select * From " + Case_Type + ",Employee where Employee.User_Name='" + username + "' and Employee.empid="+Case_Type+".empid";
            SqlCommand cmd = new SqlCommand(query, con);
            dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
        }
        else if (Case_Type.Equals("Verification_Admin"))
        {
            query = "Select * From Verification_Admin";
            SqlCommand cmd = new SqlCommand(query, con);
            dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
        }
        else
        {
            query = "Select * From " + Case_Type + ",Employee,[Case] where Employee.User_Name='" + username + "' and Employee.empid=[Case].empid and [Case].Case_no=" + Case_Type + ".Case_no";
            SqlCommand cmd = new SqlCommand(query, con);
            dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            b = true;
        }
        return b;
    }
    private void Generate_Alert()
    {
        if (Execute_Query())
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                String stat = dt.Rows[i][dt.Columns.Count - 11].ToString();
                String ext = dt.Rows[i][dt.Columns.Count - 10].ToString();
                int ex = 0;
                if (!ext.Equals("0"))
                    ex = Int32.Parse(ext);
                int p = Find_Phase(i, stat);
                for (int j = p; j < dt.Columns.Count - 12; j++)
                {
                    Case_Details c = new Case_Details();
                    c.case_no = dt.Rows[i][0].ToString();
                    String s = dt.Rows[i][j].ToString();
                    s = s.Replace("/", "#");
                    DateTime d = new DateTime(Int32.Parse(s.Split('#')[2]), Int32.Parse(s.Split('#')[0]), Int32.Parse(s.Split('#')[1]));
                    d = d.AddDays(ex);
                    c.date = d;
                    c.Case_Type = this.Case_Type;
                    c.stage = dt.Columns[j].ColumnName.ToString().Split('_')[0];
                    if (DateTime.Compare(System_Date, d) > 0)
                        c.alert = "Pending";
                    else
                        c.alert = "";
                    j++;
                    details.Add(c);
                }
            }
        }
        else if (Case_Type.Equals("Verification_Admin"))
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                String stat = dt.Rows[i][4].ToString().ToLower();
                if (stat.Equals("pending"))
                {
                    Case_Details c = new Case_Details();
                    c.case_no = dt.Rows[i][0].ToString();
                    String s = dt.Rows[i][1].ToString();
                    s = s.Replace("/", "#");
                    DateTime d = new DateTime(Int32.Parse(s.Split('#')[2]), Int32.Parse(s.Split('#')[0]), Int32.Parse(s.Split('#')[1]));
                    c.date = d;
                    c.Case_Type = this.Case_Type;
                    c.stage = "";
                    d = d.AddDays(15);
                    if (DateTime.Compare(System_Date, d) > 0)
                        c.alert = "Pending";
                    else
                        c.alert = "";
                    details.Add(c);
                }
            }
        }
        else
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                String stat = dt.Rows[i][dt.Columns.Count - 9].ToString().ToLower();
                if (stat.Equals("pending"))
                {
                        Case_Details c = new Case_Details();
                        c.case_no = dt.Rows[i][0].ToString();
                        String s = dt.Rows[i][4].ToString();
                        s = s.Replace("/", "#");
                        DateTime d = new DateTime(Int32.Parse(s.Split('#')[2]), Int32.Parse(s.Split('#')[0]), Int32.Parse(s.Split('#')[1]));
                        
                        c.date = d;
                        c.Case_Type = this.Case_Type;
                        c.stage = "";
                        d=d.AddDays(15);
                        if (DateTime.Compare(System_Date, d) > 0)
                            c.alert = "Pending";
                        else
                            c.alert = "";
                        details.Add(c);
                }
            }
        }
    }
    private int Find_Phase(int index,String phase)
    {
        for(int j=3;j<dt.Columns.Count-11;j++)
        {
            String s = dt.Columns[j].ColumnName.ToString().Split('_')[0];
            if (phase.Equals(s))
                return j;
            j++;
        }
        return 3;
    }
    private String Get_Val(String no)
    {
        String s = "";
        if (no.Equals("-999"))
        {
            for (int i = 0; i < details.Count; i++)
            {
                Case_Details c = details.ElementAt(i);
                if (!c.alert.Equals(""))
                    s = s + c.alert + "$" + c.stage + "$" + c.Case_Type + "$" + c.case_no + "$" + c.date.Date.ToString("d") + "#";
            }
        }
        else
        {
            for (int i = 0; i < details.Count; i++)
            {
                Case_Details c = details.ElementAt(i);
                if (!c.alert.Equals("")&&c.case_no.Equals(no))
                    s = s + c.alert + "$" + c.stage + "$" + c.Case_Type + "$" + c.case_no + "$" + c.date.Date.ToString("d") + "#";
            }
        }
        return s;
    }
    public String Get_Alerts(String no)
    {
        Connect_Database();
        if(Case_Type.Equals("ALL"))
        {
            Case_Type = "Trap";
            Generate_Alert();
            Case_Type = "MC";
            Generate_Alert();
            Case_Type = "DPA";
            Generate_Alert();
            Case_Type = "OE";
            Generate_Alert();
            Case_Type = "ED";
           Generate_Alert();
           Case_Type = "Application";
           Generate_Alert();
           Case_Type = "Verification";
           Generate_Alert();
        }
        else
        {
            Generate_Alert();
        }
        Sort_Details();
        return Get_Val(no);
    }
    private void Sort_Details()
    {
        details = details.OrderByDescending(o => o.date).ToList();
    }
    public String Get_Value()
    {
        return Case_Type;
    }
}
class Case_Details
{
    public String Case_Type { get; set; }
    public DateTime date { get; set; }
    public String alert { get; set; }
    public String stage { get; set; }
    public String case_no { get; set; }
}