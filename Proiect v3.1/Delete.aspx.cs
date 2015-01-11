﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.Params["id"];
        if (id != null)
        {
            try
            {
                id = Server.UrlDecode(id);
                SqlDataSource1.SelectCommand = "SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Isbn, Carti.Poza_Coperta, Carti.Id_Gen, Carti.Id_Editura, Carti.Id_Autor, Edituri.Nume_Editura, Genuri.Gen, Autori.Prenume +' ' + Autori.Nume AS NumeAutor, Carti.Text_Descriere FROM Autori INNER JOIN Carti ON Autori.Id = Carti.Id_Autor INNER JOIN Edituri ON Carti.Id_Editura = Edituri.Id INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id WHERE Carti.Id = @id";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("id", id);
                SqlDataSource1.DataBind();
            }
            catch (Exception err)
            {
                ErrorLabel.Text = ErrorLabel.Text + err;
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Home.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         if (Request.Params["id"] != null)
            try
            {
                string x = Request.Params["id"];
                int id = int.Parse(x);
                string sql = "DELETE FROM Carti WHERE Id = @id";
                SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True");
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                com.Parameters.AddWithValue("id", id);
                com.ExecuteNonQuery();
                con.Close();

                sql = "DELETE FROM Comentarii WHERE Id_Carte = @id";
                con.Open();
                com = new SqlCommand(sql, con);
                com.Parameters.AddWithValue("id", id);
                com.ExecuteNonQuery();
                con.Close();

                //String path = Server.MapPath("~/pozeCoperti/");
                //if (System.IO.File.Exists(path)) { System.IO.File.Delete(path); }

            }
            catch (Exception err)
            {
                ErrorLabel.Text = ErrorLabel.Text + err;
            }
         else
         {
             Response.Redirect("~/Home.aspx");
         }
        Response.Redirect("~/Home.aspx");
         
    }
}