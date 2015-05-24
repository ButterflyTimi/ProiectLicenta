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

    public string ProcessImageUser(object imageUser)
    {
        if (imageUser == null || imageUser == DBNull.Value)
        {
            return "DefaultUserIcon.png";
        }

        return imageUser.ToString();
    }

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
                    SqlDataSource1.SelectCommand = "SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Poza_Coperta, Carti.Text_Descriere, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor, ROUND(AVG(ISNULL(NoteDateCartilor.Nota, 0)), 0) AS MedieNote FROM Carti INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id INNER JOIN Autori ON Carti.Id_Autor = Autori.Id LEFT JOIN NoteDateCartilor ON Carti.Id = NoteDateCartilor.Id_Carte WHERE Carti.Id = @q GROUP BY Carti.Id, Carti.Titlu, Carti.Poza_Coperta, Carti.Text_Descriere, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("q", q);
                    SqlDataSource1.DataBind();


                    bool check = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
                    if (check)
                    {
                        string user = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();
                        string sqlVerif = "SELECT count(*) from PozeUseri where Id_user = @IdUser";
                        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
                        con.Open();
                        SqlCommand com = new SqlCommand(sqlVerif, con);
                        com.Parameters.AddWithValue("IdUser", user);
                        int userCount = (int)com.ExecuteScalar();
                        con.Close();
                        if (userCount > 0)
                        {
                            ImgUserPicture2.ImageUrl = "~/pozeUseri/" + user + ".jpg";

                        }
                    }

                    SqlDataSource2.SelectCommand = "SELECT Comentarii.Id, Comentarii.Comentariu_Text, Comentarii.Data, Comentarii.Id_Carte, aspnet_Users.UserName, PozeUseri.Poza_User FROM aspnet_Users INNER JOIN Comentarii ON aspnet_Users.UserId = Comentarii.Id_User LEFT OUTER JOIN PozeUseri ON Comentarii.Id_User = PozeUseri.Id_User WHERE Comentarii.Id_Carte = @q";
                    SqlDataSource2.SelectParameters.Clear();
                    SqlDataSource2.SelectParameters.Add("q", q);
                    SqlDataSource2.DataBind();

                    SqlDataSource3.SelectCommand = "SELECT TOP 10 Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Poza_Coperta, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor, Genuri.Gen FROM Carti INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id INNER JOIN Autori ON Carti.Id_Autor = Autori.Id WHERE (Genuri.Gen = (SELECT Genuri_1.Gen FROM Genuri AS Genuri_1 INNER JOIN Carti AS Carti_1 ON Genuri_1.Id = Carti_1.Id_Gen WHERE (Carti_1.Id = @q))) AND (Carti.Id <> (SELECT Id FROM Carti AS Carti_2 WHERE (Id = @q)))";
                    SqlDataSource3.SelectParameters.Clear();
                    SqlDataSource3.SelectParameters.Add("q", q);
                    SqlDataSource3.DataBind();
                    
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
            try
            {
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
        string q = Request.Params["q"];
        if (q != null)
        {
            try
            {
                bool userCheck = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
                if (userCheck) //verificare daca user-ul este autentificat
                {
                    //verificare daca user-ul deja a votat
                    string user = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();
                    string sqlVerif = "SELECT count(*) from NoteDateCartilor where Id_user = @IdUser and Id_Carte = @IdCarte";
                    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
                    con.Open();
                    SqlCommand com = new SqlCommand(sqlVerif, con);
                    com.Parameters.AddWithValue("IdUser", user);
                    com.Parameters.AddWithValue("IdCarte", q);
                    int userCount = (int)com.ExecuteScalar();
                    con.Close();
                    if (userCount > 0)
                    {
                        Label mesaj1 = Repeater1.Items[0].FindControl("AlreadyVoted") as Label;
                        mesaj1.Attributes.Add("style", "display: block");
                    }
                    else
                    {
                        string nota = TBcount.Text;
                        string sql = "INSERT INTO NoteDateCartilor (Id_Carte, Nota, Id_User) VALUES (@Id_Carte, @Nota, @Id_User)";
                        con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
                        con.Open();
                        com = new SqlCommand(sql, con);

                        int idCarte = Int32.Parse(Request.Params["q"]);
                        com.Parameters.AddWithValue("Id_Carte", idCarte);
                        com.Parameters.AddWithValue("Id_User", user);
                        com.Parameters.AddWithValue("Nota", nota);
                        com.ExecuteNonQuery();
                        con.Close();
                        Response.Redirect(Request.RawUrl);
                    }
                }
                else
                {
                    Label mesaj1 = Repeater1.Items[0].FindControl("NotLoggedInUser") as Label;
                    mesaj1.Attributes.Add("style", "display: block");
                }
            }
            catch (Exception err)
            {
            }
        }
    }
}