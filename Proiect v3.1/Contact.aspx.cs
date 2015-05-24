using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Security;
using System.Globalization;
using System.Text.RegularExpressions;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool userCheck = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
        if (userCheck)
        {
            string username = System.Web.Security.Membership.GetUser().UserName.ToString();
            string email = System.Web.Security.Membership.GetUser().Email.ToString();
            YourName.Text = username;
            YourEmail.Text = email;
            YourName.ReadOnly = true;
            YourEmail.ReadOnly = true;
        }
            
    }
    bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return true;
        }
        catch
        {
            return false;
        }
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
            var verif = YourEmail.Text.ToString();
            if (IsValidEmail(verif))
            {
                SendMail();
                YourSubject.Text = "";
                YourEmail.Text = "";
                YourName.Text = "";
                Comments.Text = "";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorFunction", "errorMessages('Felicitari! Mesajul a fost trimis cu succes!','success');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorFunction", "errorMessages('Adresa de email invalida!','danger');", true);
            }
            
        }
        catch (Exception) { }
    }
}