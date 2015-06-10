using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                string sql = "SELECT Gen, COUNT(*) AS NumarGenuri FROM Carti INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id GROUP BY Genuri.Gen";
                SqlConnection con = ConnectionFactory.getNewSqlConnection();
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                SqlDataReader reader = com.ExecuteReader();
                //ListItem newItem = new ListItem();
                string obiect = "[";
                while (reader.Read())
                {
                    obiect += "{\"text\": \"" + reader["Gen"].ToString() + "\", \"weight\": " + reader["NumarGenuri"].ToString() + ", \"link\": \"Search.aspx?q=" + reader["Gen"].ToString() + "\"},";
                }

                sql = "SELECT Autori.Prenume +' '+Autori.Nume AS NumeAutor, COUNT(*) AS NumarAutori FROM Autori INNER JOIN Carti ON Autori.Id = Carti.Id_Autor GROUP BY Autori.Prenume,Autori.Nume";
                com = new SqlCommand(sql, con);
                reader.Close();
                SqlDataReader reader2 = com.ExecuteReader();
                while (reader2.Read())
                {
                    obiect += "{\"text\": \"" + reader2["NumeAutor"].ToString() + "\", \"weight\": " + reader2["NumarAutori"].ToString() + ", \"link\": \"Search.aspx?q=" + reader2["NumeAutor"].ToString() + "\"},";
                }
                obiect = obiect.Remove(obiect.Length - 1);
                obiect += "]";
                reader2.Close();
                con.Close();
                TBObject.Text = obiect;

                bool check = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
                if (check)
                {
                    string userId = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();

                    con = ConnectionFactory.getNewSqlConnection();
                    con.Open();
                    sql = "SELECT Genuri.Gen, COUNT(*) AS NumarGenuri FROM Carti INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id  INNER JOIN CartiFavorite ON Carti.Id = CartiFavorite.Id_Carte WHERE CartiFavorite.Id_User = @user GROUP BY Gen";
                    com = new SqlCommand(sql, con);
                    com.Parameters.AddWithValue("user", userId);
                    reader = com.ExecuteReader();
                    int maxim = 0;
                    string numeCategorie = "";
                    while (reader.Read())
                    {
                        if (maxim < Convert.ToInt32(reader["NumarGenuri"].ToString()))
                        {
                            maxim = Convert.ToInt32(reader["NumarGenuri"].ToString());
                            numeCategorie = reader["Gen"].ToString();
                        }
                    }
                    reader.Close();
                    con.Close();

                    SqlDataSource1.SelectCommand = "SELECT TOP 6 Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Poza_Coperta, Carti.Text_Descriere, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor, ROUND(AVG(ISNULL(NoteDateCartilor.Nota, 0)), 0) AS MedieNote FROM Carti INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id INNER JOIN Autori ON Carti.Id_Autor = Autori.Id LEFT JOIN NoteDateCartilor ON Carti.Id = NoteDateCartilor.Id_Carte WHERE Genuri.Gen = @gen AND NOT EXISTS (SELECT CartiFavorite.Id_Carte FROM CartiFavorite Where CartiFavorite.Id_Carte = Carti.Id AND CartiFavorite.Id_User = @user) GROUP BY Carti.Id, Carti.Titlu, Carti.Poza_Coperta, Carti.Text_Descriere, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume ORDER BY MedieNote DESC";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("gen", numeCategorie);
                    SqlDataSource1.SelectParameters.Add("user", userId);
                    SqlDataSource1.DataBind();
                    
                }
                else
                {
                    SqlDataSource1.SelectCommand = "SELECT TOP 6 Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Poza_Coperta, Carti.Text_Descriere, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor, ROUND(AVG(ISNULL(NoteDateCartilor.Nota, 0)), 0) AS MedieNote FROM Carti INNER JOIN Genuri ON Carti.Id_Gen = Genuri.Id INNER JOIN Autori ON Carti.Id_Autor = Autori.Id LEFT JOIN NoteDateCartilor ON Carti.Id = NoteDateCartilor.Id_Carte GROUP BY Carti.Id, Carti.Titlu, Carti.Poza_Coperta, Carti.Text_Descriere, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume ORDER BY MedieNote DESC";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.DataBind();
                }
                
            }
            catch (Exception err)
            {
                Response.Write(err);
            }
        }
    }
}