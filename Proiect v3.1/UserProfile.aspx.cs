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
                    Username.Text = username;
                    Email.Text = email;
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
                    UsernameTaken.Attributes.Add("style", "display: block");
                    Response.Write(temp);
                }
                else
                {
                    //Schimbare username --- nu merge
                    /*string update = "UPDATE aspnet_Users set UserName = @unamenou, LoweredUserName = @unamelower where UserName = @unamevechi";
                    SqlCommand com2 = new SqlCommand(update, con);
                    com2.Parameters.AddWithValue("@unamevechi", usernameC);
                    com2.Parameters.AddWithValue("@unamelower", usernameNou.ToLower());
                    com2.Parameters.AddWithValue("@unamenou", usernameNou);
                    com2.ExecuteNonQuery();*/
                    //Response.Write("Actualizare realizata cu succes!");
                    //UsernameTaken.Attributes.Add("style", "display: none");
                    Response.Redirect(Request.RawUrl);
                    //Response.Write(usernameNou);
                }
            }
            else
            {
            }
            con.Close();
        }
        catch (Exception err)
        {
        }
    }
    protected void submit_userPassChange(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception err)
        {
        }
    }
}