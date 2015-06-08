using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class InsertDatas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit_editura(object sender, EventArgs e)
    {
        try
        {
            string ed = TBEditura.Text; //da
            string link = TBLinkEditura.Text; //da
            SqlConnection con = ConnectionFactory.getNewSqlConnection();
            con.Open();



            string sql = "INSERT INTO EDITURI (EDITURA, SITE_EDITURA) VALUES (@nume, @link)";
            SqlCommand com = new SqlCommand(sql, con);
            com.Parameters.AddWithValue("nume", ed);
            com.Parameters.AddWithValue("link", link);
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }
        catch (Exception err)
        {
            ErrorLabel.Text = ErrorLabel.Text + err;
        }
    }
    protected void submit_autor(object sender, EventArgs e)
    {
        try
        {
            string num = TBNume.Text; //da
            string pren = TBPrenume.Text; //da
            SqlConnection con = ConnectionFactory.getNewSqlConnection();
            con.Open();

            /*string sqlCheck = "SELECT NUME, PRENUME FROM AUTORI";*/


            string sql = "INSERT INTO AUTORI (NUME, PRENUME) VALUES (@NUME, @PRENUME)";
            SqlCommand com = new SqlCommand(sql, con);
            com.Parameters.AddWithValue("nume", num);
            com.Parameters.AddWithValue("prenume", pren);
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }
        catch (Exception err)
        {
            ErrorLabel.Text = ErrorLabel.Text + err;
        }
    }
    protected void submit_gen(object sender, EventArgs e)
    {
        try
        {
            string g = TBGen.Text;
            string sql = "INSERT INTO GENURI (GEN) VALUES (@GEN)";
            SqlConnection con = ConnectionFactory.getNewSqlConnection();
            con.Open();
            SqlCommand com = new SqlCommand(sql, con);
            com.Parameters.AddWithValue("gen", g);
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }
        catch (Exception err)
        {
            ErrorLabel.Text = ErrorLabel.Text + err;
        }
    }

    protected void submit_carte(object sender, EventArgs e)
    {
        try
        {
            string t = TBTitlu.Text;
            string d = TBDescriere.Text;
            d = d.Replace("(new_line)", "<br /><br />");
            int id_autor = int.Parse(DDLAutor.SelectedValue);
            int id_gen = int.Parse(DDLGen.SelectedValue);

            String type = FileUploadPozaCoperta.PostedFile.ContentType.ToLower() ;
            if (FileUploadPozaCoperta.HasFile && (type.Contains("jpg") || type.Contains("jpeg")))
            {
                FileUploadPozaCoperta.SaveAs(Server.MapPath("~") + "/pozeCoperti/" + t + ".jpg");
                string sql = "INSERT INTO Carti (TITLU, POZA_COPERTA, ID_GEN, ID_AUTOR, TEXT_DESCRIERE) VALUES (@TITLU, @POZA, @ID_GEN, @ID_AUTOR, @TEXT_DESCRIERE)";
                SqlConnection con = ConnectionFactory.getNewSqlConnection();
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.Parameters.AddWithValue("TITLU", t);
                com.Parameters.AddWithValue("ID_GEN", id_gen);
                com.Parameters.AddWithValue("ID_AUTOR", id_autor);
                com.Parameters.AddWithValue("TEXT_DESCRIERE", d);
                string urlPoza = t + ".jpg";
                com.Parameters.AddWithValue("POZA", urlPoza);
                com.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }
        catch (Exception err)
        {
            ErrorLabel.Text = ErrorLabel.Text + err;
        }
    }
    protected void submit_carteEditura(object sender, EventArgs e)
    {
        try
        {
            int id_carte = int.Parse(DDLCarte.SelectedValue);
            int id_editura = int.Parse(DDLEditura.SelectedValue);
            string sql = "INSERT INTO CartiApartinDeEdituri (ID_CARTE, ID_EDITURA) VALUES (@ID_CARTE, @ID_EDITURA)";
            SqlConnection con = ConnectionFactory.getNewSqlConnection();
            con.Open();
            SqlCommand com = new SqlCommand(sql, con);
            com.Parameters.AddWithValue("ID_CARTE", id_carte);
            com.Parameters.AddWithValue("ID_EDITURA", id_editura);
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }
        catch (Exception err)
        {
            ErrorLabel.Text = ErrorLabel.Text + err;
        }
    }
}