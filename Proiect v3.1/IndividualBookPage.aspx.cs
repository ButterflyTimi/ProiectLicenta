using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

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
                    SqlDataSource1.SelectCommand = " SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Poza_Coperta, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor, Carti.Text_Descriere FROM Autori INNER JOIN Carti ON Autori.Id = Carti.Id_Autor INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id WHERE Carti.Id = @q";
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
            else
            {
                Response.Redirect("~/Home.aspx");
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

        string q = Request.Params["q"];
        if (q != null)
        {
            try {
            int idCarte = Int32.Parse(Request.Params["q"]);
            com.Parameters.AddWithValue("Comentariu_Text", tb);
            com.Parameters.AddWithValue("Data", data);
            com.Parameters.AddWithValue("Id_User", user);
            com.Parameters.AddWithValue("Id_Carte", idCarte);
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
            }
            catch (Exception err)
                {
                }
        }
    }
    protected void bookRating(object sender, EventArgs e)
    {
        string nota = TBcount.Text;
        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('"+nota+"');", true);
        string user = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();
        string sql = "INSERT INTO NoteDateCartilor (Id_Carte, Nota, Id_User) VALUES (@Id_Carte, @Nota, @Id_User)";
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        string q = Request.Params["q"];
        if (q != null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + nota + "');", true);
            try 
            {
                int idCarte = Int32.Parse(Request.Params["q"]);
                com.Parameters.AddWithValue("Id_Carte", idCarte);
                com.Parameters.AddWithValue("Id_User", user);
                com.Parameters.AddWithValue("Nota", nota);
                com.ExecuteNonQuery();
                con.Close();
                //Response.Redirect(Request.RawUrl);
            }
            catch (Exception err)
            {
            }
        }
    }
}