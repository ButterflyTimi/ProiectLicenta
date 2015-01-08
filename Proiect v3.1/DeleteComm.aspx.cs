using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class DeleteComm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Home.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Params["q"] != null)
            try
            {
                string x = Request.Params["q"];
                int id = int.Parse(x);
                string sql = "DELETE FROM Comentarii WHERE Id = @id";
                SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True");
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.Parameters.AddWithValue("id", id);
                com.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception err)
            {
                ErrorLabel.Text = ErrorLabel.Text + err;
            }
        Response.Redirect("~/Home.aspx");

    }
}