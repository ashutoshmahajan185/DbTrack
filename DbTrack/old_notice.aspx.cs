using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;

public partial class old_notice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Populating a DataTable from database.
            // DataTable dt = this.GetData();

            string db = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;



            SqlConnection con = new SqlConnection(db);
            con.Open();

            string query = "Select Name,Sdate,Notice From Notice order by date DESC";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();    //using System.Data  //only this line differs from dataset
            //dataset is collection of data tables
            sda.Fill(dt);  //dt instead of ds


            //Building an HTML string.
            StringBuilder html = new StringBuilder();

            foreach (DataRow row in dt.Rows)
            {

                html.Append("<div class='media stream'>");
                html.Append("<a  class='media-avatar medium pull-left'>");
                html.Append("<img src='images/LOGO.png'></a>");
                html.Append("<div class='media-body'>");

                html.Append("<div class='stream-text'>");
                int i = 1;
                foreach (DataColumn column in dt.Columns)
                {
                    if (i == 1)
                    {

                        html.Append("<div class='stream-headline'>");
                        html.Append("<h5 class='stream-author'>");
                        html.Append(row[column.ColumnName]);
                        html.Append("&nbsp;");

                    }
                    if (i == 2)
                    {

                        html.Append(" <small>");
                        html.Append(" <b>");
                        html.Append(row[column.ColumnName]);
                        html.Append(" </b>");
                        html.Append(" </small>");
                        html.Append(" </h5>");
                        html.Append("</div>");
                    }
                    if (i == 3)
                    {
                        html.Append("<div class='stream-text'>");
                        html.Append(" <font color='blue'>");

                        html.Append(row[column.ColumnName]);
                        html.Append(" </font>");
                        html.Append("</div>");
                    }
                    i++;
                }

                html.Append("</div>");
                html.Append("</div>");
                html.Append("</div>");


            }

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }


    }

    protected void Button1_Click(object sender, EventArgs e)
    {






        string db = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
        string query = "";


        SqlConnection con = new SqlConnection(db);
        con.Open();
        if (DropDownList1.Text == "No Filter")
        {
            query = "Select Name,Sdate,Notice From Notice order by date DESC";
        }
        else
        {
            query = "Select Name,Sdate,Notice From Notice where Sdate LIKE '%" + DropDownList1.Text + "%'";
        }

        SqlCommand cmd = new SqlCommand(query, con);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();    //using System.Data  //only this line differs from dataset
        //dataset is collection of data tables
        sda.Fill(dt);  //dt instead of ds


        //Building an HTML string.
        StringBuilder html = new StringBuilder();

        foreach (DataRow row in dt.Rows)
        {

            html.Append("<div class='media stream'>");
            html.Append("<a  class='media-avatar medium pull-left'>");
            html.Append("<img src='images/LOGO.png'></a>");
            html.Append("<div class='media-body'>");

            html.Append("<div class='stream-text'>");
            int i = 1;
            foreach (DataColumn column in dt.Columns)
            {
                if (i == 1)
                {

                    html.Append("<div class='stream-headline'>");
                    html.Append("<h5 class='stream-author'>");
                    html.Append(row[column.ColumnName]);
                    html.Append("&nbsp;");

                }
                if (i == 2)
                {

                    html.Append(" <small>");
                    html.Append(" <b>");
                    html.Append(row[column.ColumnName]);
                    html.Append(" </b>");
                    html.Append(" </small>");
                    html.Append(" </h5>");
                    html.Append("</div>");
                }
                if (i == 3)
                {
                    html.Append("<div class='stream-text'>");
                    html.Append(" <font color='blue'>");

                    html.Append(row[column.ColumnName]);
                    html.Append(" </font>");
                    html.Append("</div>");
                }
                i++;
            }

            html.Append("</div>");
            html.Append("</div>");
            html.Append("</div>");


        }

        //Append the HTML string to Placeholder.
        PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
    }
}


