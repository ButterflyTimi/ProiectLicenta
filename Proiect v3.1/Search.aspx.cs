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
            if (a == null || a =="data")
                try
                {
                    q = Server.UrlDecode(q);
                    SqlDataSource1.SelectCommand = " SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu , Carti.Isbn, Carti.Poza_Coperta, Genuri.Gen, Edituri.Nume_Editura, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen INNER JOIN Edituri ON Carti.Id_Editura = Edituri.Id ON Autori.Id = Carti.Id_Autor WHERE Carti.Titlu like @q OR Carti.Isbn like @q OR Genuri.Gen like @q OR Edituri.Nume_Editura like @q OR Autori.Nume like @q OR Autori.Prenume like @q OR Autori.Prenume + ' ' + Autori.Nume like @q OR Autori.Nume + ' ' + Autori.Prenume like @q ORDER BY CartiId ";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("q", q + "%");
                    SqlDataSource1.DataBind();
                }
                catch (Exception err)
                {
                }
            else
            {
                try
                {
                    q = Server.UrlDecode(q);
                    SqlDataSource1.SelectCommand = " SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu , Carti.Isbn, Carti.Poza_Coperta, Genuri.Gen, Edituri.Nume_Editura, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen INNER JOIN Edituri ON Carti.Id_Editura = Edituri.Id ON Autori.Id = Carti.Id_Autor WHERE Carti.Titlu like @q OR Carti.Isbn like @q OR Genuri.Gen like @q OR Edituri.Nume_Editura like @q OR Autori.Nume like @q OR Autori.Prenume like @q OR Autori.Prenume + ' ' + Autori.Nume like @q OR Autori.Nume + ' ' + Autori.Prenume like @q ORDER BY CartiTitlu";
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        string a = RadioButtonList1.SelectedValue;
        Response.Redirect("Search.aspx?q=" + Request.Params["q"] + "&sortby=" + a);

    }
}