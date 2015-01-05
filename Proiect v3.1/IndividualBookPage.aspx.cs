using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class IndividualBookPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string q = Request.Params["q"];
            if (q != null)
            {
                try
                {
                    q = Server.UrlDecode(q);
                    SqlDataSource1.SelectCommand = " SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Isbn, Carti.Poza_Coperta, Genuri.Gen, Edituri.Nume_Editura, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor, DescriereCarti.Text_Descriere FROM Autori INNER JOIN Carti ON Autori.Id = Carti.Id_Autor INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id INNER JOIN Edituri ON Carti.Id_Editura = Edituri.Id INNER JOIN DescriereCarti ON Carti.Id = DescriereCarti.Id_Carte WHERE Carti.Id = @q";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("q", q);
                    SqlDataSource1.DataBind();

                    /*
                    SqlDataSource2.SelectCommand = " SELECT a.UserName AS UserName, b.Comentariu_Text, b.Data  FROM ASPNETDB.MDF.aspnet_Users a inner join BazaDateCarti.mdf.Comentarii b  ON a.UserId=b.Id_User WHERE Id_Carte = @q";
                    SqlDataSource2.SelectParameters.Clear();
                    SqlDataSource2.SelectParameters.Add("q", q);
                    SqlDataSource2.DataBind();*/
                    
                }
                catch (Exception err)
                {
                    ErrorLabel.Text = ErrorLabel.Text + err;
                }
            }
        }
    }

    protected void post_comment(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }

}