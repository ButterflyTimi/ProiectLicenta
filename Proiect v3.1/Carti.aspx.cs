using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Carti : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
                con.Open();
                string sql = "SELECT Genuri.Gen, Genuri.Id, COUNT(*) AS NumarGenuri FROM Carti INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id GROUP BY Genuri.Gen, Genuri.Id";
                SqlCommand com = new SqlCommand(sql, con);
                SqlDataReader dr = com.ExecuteReader();
                CheckBoxGen.DataValueField = "Id";
                CheckBoxGen.DataTextField = "Gen";
                CheckBoxGen.DataSource = dr;
                CheckBoxGen.DataBind();
                con.Close();
            }
            catch (Exception err)
            {
                Response.Write(err);
            }
        }

        /*
         SqlConnection con=newSqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        stringquery;
        try
        {
            query="SELECT distinct[Clg_name] FROM [Complete_table]";
            con.Open();
            SqlDataAdapter da=newSqlDataAdapter(query,con);
            DataSet ds=newDataSet();
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count!=0)
            {
                CheckBoxList1.DataSource=ds;
                CheckBoxList1.DataTextField="Clg_Name";
                CheckBoxList1.DataValueField="Clg_Name";
                CheckBoxList1.DataBind();
            }
            else
            {
                Response.Write("No Results found");
            }
        }
        catch(Exception ex)
        {
            Response.Write("<br>"+ex);
        }
        finally
        {
            con.Close();
        }
    }
}
         
         */
    }
    protected void Select_Gen(object sender, EventArgs e)
    {
        
    }
}