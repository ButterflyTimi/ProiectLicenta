﻿using System;
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

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        //Roles.AddUserToRole(CreateUserWizard1.UserName, "User");
    }
    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Home.aspx");
    }
}