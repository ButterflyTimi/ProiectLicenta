using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Threading;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                bool userCheck = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
                if (userCheck)
                {
                    string username = System.Web.Security.Membership.GetUser().UserName.ToString();
                    string email = System.Web.Security.Membership.GetUser().Email.ToString();
                    string user = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();
                    Username.Text = username;
                    Email.Text = email;

                    string sqlVerif = "SELECT count(*) from PozeUseri where Id_User = @IdUser";
                    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
                    con.Open();
                    SqlCommand com = new SqlCommand(sqlVerif, con);
                    com.Parameters.AddWithValue("IdUser", user);
                    int userCount = (int)com.ExecuteScalar();
                    con.Close();
                    if (userCount > 0)
                    {
                        string sql = "SELECT Poza_User FROM PozeUseri WHERE Id_User = @IdUser";
                        con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
                        con.Open();
                        com = new SqlCommand(sql, con);
                        com.Parameters.AddWithValue("IdUser", user);
                        try
                        {
                            SqlDataReader r = com.ExecuteReader();
                            while (r.Read())
                            {
                                UserImage.ImageUrl = "~/pozeUseri/" + r["Poza_User"].ToString();
                            }
                        }
                        catch (Exception err)
                        {
                            Response.Write(err);
                        }
                        con.Close();
                    }
                    else
                    {
                        UserImage.Attributes["src"] = "pozeUseri/DefaultUserIcon.png";
                    }
                }
                else
                {
                    Response.Redirect("~/Home.aspx");
                }
            }
            catch (Exception err)
            {
            }
        }
        if (IsPostBack && UserProfilePicture.PostedFile != null)
        {
            try
            {
                if (UserProfilePicture.HasFile)
                {
                    String type = UserProfilePicture.PostedFile.ContentType.ToLower();
                    System.Drawing.Image img = System.Drawing.Image.FromStream(UserProfilePicture.PostedFile.InputStream);
                    int height = img.Height;
                    int width = img.Width;
                    decimal size = Math.Round(((decimal)UserProfilePicture.PostedFile.ContentLength / (decimal)1024), 2);
                    if (size > 3500)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorFunction", "errorMessages('Imagine prea mare! Dimensiunea maxima pentru imagine este 3,5MB.');", true);
                    }
                    else
                    {

                        if (type.Contains("jpg") || type.Contains("jpeg"))
                        {
                            string user = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();
                            UserProfilePicture.SaveAs(Server.MapPath("~/pozeUseri/") + user + ".jpg");

                            string sqlVerif = "SELECT count(*) from PozeUseri where Id_User = @IdUser";
                            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
                            con.Open();
                            SqlCommand com = new SqlCommand(sqlVerif, con);
                            com.Parameters.AddWithValue("IdUser", user);
                            int userCount = (int)com.ExecuteScalar();
                            con.Close();
                            //Response.Write(userCount);
                            if (userCount > 0)
                            {
                                string sql = "UPDATE PozeUseri SET Poza_User = @Poza WHERE Id_User = @IdUser";
                                con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
                                con.Open();
                                com = new SqlCommand(sql, con);
                                com.Parameters.AddWithValue("IdUser", user);
                                string urlPoza = user + ".jpg";
                                com.Parameters.AddWithValue("Poza", urlPoza);
                                com.ExecuteNonQuery();
                                con.Close();
                                UserImage.ImageUrl = "~/pozeUseri/" + urlPoza;
                            }
                            else
                            {
                                string sql = "INSERT INTO PozeUseri (Id_User, Poza_User) VALUES (@IdUser, @Poza)";
                                con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
                                con.Open();
                                com = new SqlCommand(sql, con);
                                com.Parameters.AddWithValue("IdUser", user);
                                string urlPoza = user + ".jpg";
                                com.Parameters.AddWithValue("Poza", urlPoza);
                                com.ExecuteNonQuery();
                                con.Close();
                                UserImage.ImageUrl = "~/pozeUseri/" + urlPoza;
                            }
                        }
                        Response.Redirect(Request.RawUrl, false);
                    }
                }
            }
            catch (Exception err)
            {
                Response.Write(err);
            }
        }
    }
    protected void submit_userInformation(object sender, EventArgs e)
    {
        try
        {
            string usernameNou = Username.Text;
            string usernameC = System.Web.Security.Membership.GetUser().UserName.ToString();
            string emailNou = Email.Text;

            //Validare email?

            MembershipUser userInfo;
            userInfo = Membership.GetUser(User.Identity.Name);
            userInfo.Email = emailNou;
            Membership.UpdateUser(userInfo);

            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            if (usernameNou != usernameC)
            {
                
                string getuser = "select count(*) from aspnet_Users where UserName= @param";
                SqlCommand com = new SqlCommand(getuser, con);
                com.Parameters.AddWithValue("param", usernameNou);
                int temp = (int)com.ExecuteScalar();
                if (temp > 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorFunction", "errorMessages('Nume utilizator deja existent!','danger');", true);
                }
                else
                {
                    string update = "UPDATE aspnet_Users set UserName = @unamenou, LoweredUserName = @unamelower where UserName = @unamevechi";
                    SqlCommand com2 = new SqlCommand(update, con);
                    com2.Parameters.AddWithValue("@unamevechi", usernameC);
                    com2.Parameters.AddWithValue("@unamelower", usernameNou.ToLower());
                    com2.Parameters.AddWithValue("@unamenou", usernameNou);
                    com2.ExecuteNonQuery();
                    FormsAuthentication.SetAuthCookie(usernameNou, false);
                    Response.Redirect(Request.RawUrl);
                }
            }
            con.Close();
                    }
       catch (Exception err) 
        {
        }
    }
}