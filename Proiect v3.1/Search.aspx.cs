using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string q = Request.Params["q"];
        if (q != null)
        {
            string a = Request.Params["sortby"];
            if (a != null && a == "autor")
            {
                try
                {
                    q = Server.UrlDecode(q);
                    SqlDataSource1.SelectCommand = " SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Poza_Coperta, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen ON Autori.Id = Carti.Id_Autor WHERE Carti.Titlu like @q OR Genuri.Gen like @q OR Autori.Nume like @q OR Autori.Prenume like @q OR Autori.Prenume + ' ' + Autori.Nume like @q OR Autori.Nume + ' ' + Autori.Prenume like @q ORDER BY Prenume, Nume";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("q", q + "%");
                    SqlDataSource1.DataBind();
                }
                catch (Exception err)
                {
                }
            }
            else
            {
                if (a != null && a == "titlu")
                {
                    try
                    {
                        q = Server.UrlDecode(q);
                        SqlDataSource1.SelectCommand = " SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu , Carti.Poza_Coperta, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen ON Autori.Id = Carti.Id_Autor WHERE Carti.Titlu like @q OR Genuri.Gen like @q OR Autori.Nume like @q OR Autori.Prenume like @q OR Autori.Prenume + ' ' + Autori.Nume like @q OR Autori.Nume + ' ' + Autori.Prenume like @q ORDER BY CartiTitlu";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("q", q + "%");
                        SqlDataSource1.DataBind();
                    }
                    catch (Exception err)
                    {
                    }
                }
                else
                {
                    try
                    {
                        q = Server.UrlDecode(q);
                        SqlDataSource1.SelectCommand = " SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu , Carti.Poza_Coperta, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen ON Autori.Id = Carti.Id_Autor WHERE Carti.Titlu like @q OR Genuri.Gen like @q OR Autori.Nume like @q OR Autori.Prenume like @q OR Autori.Prenume + ' ' + Autori.Nume like @q OR Autori.Nume + ' ' + Autori.Prenume like @q";
                        SqlDataSource1.SelectParameters.Clear();
                        SqlDataSource1.SelectParameters.Add("q", q + "%");
                        SqlDataSource1.DataBind();
                    }
                    catch (Exception err)
                    {
                    }
                }
            }
        }
    }
    /*protected void Button1_Click(object sender, EventArgs e)
    {
        string a = RadioButtonList1.SelectedValue;
        Response.Redirect("Search.aspx?q=" + Request.Params["q"] + "&sortby=" + a);

    }*/

    protected void Sort_By(object sender, EventArgs e)
    {
        string a = RadioButtonList1.SelectedValue;
        Response.Redirect("Search.aspx?q=" + Request.Params["q"] + "&sortby=" + a);

    }
}