using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}