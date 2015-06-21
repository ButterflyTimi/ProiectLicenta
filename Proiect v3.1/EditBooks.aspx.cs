using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class EditBooks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string q = Request.Params["id"];
            if (q != null)
            {
                try
                {
                    int id = int.Parse(q);
                    string sql = "SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Poza_Coperta, Carti.Id_Gen, Carti.Id_Autor, Genuri.Gen, Autori.Prenume +' ' + Autori.Nume AS NumeAutor, Carti.Text_Descriere FROM Autori INNER JOIN Carti ON Autori.Id = Carti.Id_Autor INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id WHERE Carti.Id = @id";
                    SqlConnection con = ConnectionFactory.getNewSqlConnection();
                    con.Open();
                    SqlCommand com = new SqlCommand(sql, con);
                    com.Parameters.AddWithValue("id", id);
                    try
                    {
                        SqlDataReader r = com.ExecuteReader();
                        while (r.Read())
                        {
                            Image1.ImageUrl = "~/pozeCoperti/" + r["Poza_Coperta"].ToString();
                            TBTitlu.Text = r["CartiTitlu"].ToString();
                            DDLAutor.SelectedValue = r["Id_autor"].ToString();
                            DDLGen.SelectedValue = r["Id_Gen"].ToString();
                            TBDescriere.Text = r["Text_Descriere"].ToString();
                        }
                    }
                    catch (Exception err)
                    {
                        ErrorLabel.Text = ErrorLabel.Text + err;
                    }
                    con.Close();
                }
                catch (Exception err)
                {
                    ErrorLabel.Text = ErrorLabel.Text + err;
                }
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }
    }
    protected void submit_updateCarte(object sender, EventArgs e)
    {
        string q = Request.Params["id"];
        if (q != null)
        {
            try
            {
                int id = int.Parse(q);
                int id_autor = int.Parse(DDLAutor.SelectedValue);
                int id_gen = int.Parse(DDLGen.SelectedValue);
                string titlu = TBTitlu.Text;
                string descriere = TBDescriere.Text;
                descriere = descriere.Replace("(new_line)", "<br /><br />");
                string sql = "UPDATE Carti SET Titlu = @Titlu, Id_Autor = @Id_Autor, Id_Gen = @Id_Gen, Text_Descriere = @Text_Descriere WHERE Id = @id";
                SqlConnection con = ConnectionFactory.getNewSqlConnection();
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.Parameters.AddWithValue("id", id);
                com.Parameters.AddWithValue("Titlu", titlu);
                com.Parameters.AddWithValue("Id_Autor", id_autor);
                com.Parameters.AddWithValue("Id_Gen", id_gen);
                com.Parameters.AddWithValue("Text_Descriere", descriere);
                com.ExecuteNonQuery();
                con.Close();

                Session["editBook"] = "1";
                q = Request.Params["id"];
                Response.Redirect("IndividualBookPage.aspx?q=" + q);
            }
            catch (Exception err)
            {
                ErrorLabel.Text = ErrorLabel.Text + err;
            }
        }
    }
    protected void back_home(object sender, EventArgs e)
    {
        string q = Request.Params["id"];
        Response.Redirect("IndividualBookPage.aspx?q=" + q);
    }
    
}