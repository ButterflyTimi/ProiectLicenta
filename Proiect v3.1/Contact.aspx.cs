using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Security;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*bool userCheck = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
        if (userCheck)
        {

        }
        else
        {
            //string user = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();
            //string username = System.Web.Security.Membership.GetUser().UserName.ToString();
            //MembershipUser u = Membership.GetUser(User.Identity.Name);
            //Response.Write(u);
        }*/
            
    }

    protected void SendMail()
    {
        // Gmail Address from where you send the mail
        var fromAddress = "timeagavrila.contact@gmail.com";
        // any address where the email will be sending
        var toAddress = YourEmail.Text.ToString();
        //Password of your gmail address
        const string fromPassword = "Parola123";
        // Passing the values and make a email formate to display
        string subject = YourSubject.Text.ToString();

        string body = "Nume: " + YourName.Text + "\n";
        body += "Email: " + YourEmail.Text + "\n";
        body += "Subiect: " + YourSubject.Text + "\n";
        body += "Mesaj/Intrebare: \n" + Comments.Text + "\n";

        // smtp settings
        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
            smtp.Timeout = 20000;
        }
        // Passing values to smtp object
        string sub = "Formular contact Carul cu Carti";
        smtp.Send(fromAddress, toAddress, sub, body);
        smtp.Send(fromAddress, fromAddress, sub, body);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            //here on button click what will done 
            SendMail();
            DisplayMessage.Text = "Felicitari! Mesajul a fost trimis cu succes!";
            DisplayMessage.Visible = true;
            YourSubject.Text = "";
            YourEmail.Text = "";
            YourName.Text = "";
            Comments.Text = "";
        }
        catch (Exception) { }
    }
}