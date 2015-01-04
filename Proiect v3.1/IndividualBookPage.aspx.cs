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
                    SqlDataSource1.SelectCommand = " SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu , Carti.Isbn, Carti.Poza_Coperta, Genuri.Gen, Edituri.Nume_Editura, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen INNER JOIN Edituri ON Carti.Id_Editura = Edituri.Id ON Autori.Id = Carti.Id_Autor WHERE Carti.Id = @q";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("q", q);
                    SqlDataSource1.DataBind();
                }
                catch (Exception err)
                {
                    ErrorLabel.Text = ErrorLabel.Text + err;
                }
            }
        }
    }
}