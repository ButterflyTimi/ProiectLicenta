using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class RegistrationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool user = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
        if (user)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
    protected void CreateUserWizard1_CreatedUser1(object sender, EventArgs e)
    {
        Roles.AddUserToRole(CreateUserWizard1.UserName, "Admin");
    }
}