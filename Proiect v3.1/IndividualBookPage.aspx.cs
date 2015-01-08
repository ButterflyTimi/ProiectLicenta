using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
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
                    SqlDataSource1.SelectCommand = " SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Isbn, Carti.Poza_Coperta, Genuri.Gen, Edituri.Nume_Editura, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor, Carti.Text_Descriere FROM Autori INNER JOIN Carti ON Autori.Id = Carti.Id_Autor INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id INNER JOIN Edituri ON Carti.Id_Editura = Edituri.Id WHERE Carti.Id = @q";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("q", q);
                    SqlDataSource1.DataBind();

                    
                    SqlDataSource2.SelectCommand = " SELECT Comentarii.Id, Comentarii.Comentariu_Text, Comentarii.Data, Comentarii.Id_Carte, aspnet_Users.UserName FROM aspnet_Users INNER JOIN Comentarii ON aspnet_Users.UserId = Comentarii.Id_User WHERE Comentarii.Id_Carte = @q";
                    SqlDataSource2.SelectParameters.Clear();
                    SqlDataSource2.SelectParameters.Add("q", q);
                    SqlDataSource2.DataBind();

                }
                catch (Exception err)
                {
                }
            }
        }
    }

    protected void post_comment(object sender, EventArgs e)
    {
        TextBox text = ((TextBox)(this.LoginView1.FindControl("TBComentariu")));
        string tb = text.Text;
        tb = tb.Replace("(new_line)", "<br />");
        string user = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();
        DateTime data = DateTime.Now;
        string sql = "INSERT INTO Comentarii (Comentariu_Text, Data, Id_User, Id_Carte) VALUES (@Comentariu_Text, @Data, @Id_User, @Id_Carte)";
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        int idCarte = Int32.Parse(Request.Params["q"]);
        com.Parameters.AddWithValue("Comentariu_Text", tb);
        com.Parameters.AddWithValue("Data", data);
        com.Parameters.AddWithValue("Id_User", user);
        com.Parameters.AddWithValue("Id_Carte", idCarte);
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect(Request.RawUrl);
    }

}