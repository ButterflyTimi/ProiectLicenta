using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Carti : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
            }
            catch (Exception err)
            {
                Response.Write(err);
            }
        }

    }
    protected void Select_Gen(object sender, EventArgs e)
    {
        
    }
}