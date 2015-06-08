using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class Carti : System.Web.UI.Page
{
    static String defaultSql = "SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Text_Descriere, Carti.Poza_Coperta, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen ON Autori.Id = Carti.Id_Autor WHERE 1=1";
    static String genSql = "";
    static String autorSql = "";
    static String final = defaultSql;

    protected void runFilter()
    {
        final = defaultSql + genSql + autorSql;
        BindRepeater(final);
    }

    //This property will contain the current page number 
    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
            {
                return Convert.ToInt32(ViewState["PageNumber"]);
            }
            else
            {
                return 0;
            }
        }
        set { ViewState["PageNumber"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "SELECT Carti.Id AS CartiId, Carti.Titlu AS CartiTitlu, Carti.Text_Descriere, Carti.Poza_Coperta, Genuri.Gen, Autori.Prenume + ' ' + Autori.Nume AS NumeAutor FROM Autori INNER JOIN Genuri INNER JOIN Carti ON Genuri.Id = Carti.Id_Gen ON Autori.Id = Carti.Id_Autor WHERE 1=1";
        BindRepeater(sql);
        if (!Page.IsPostBack)
        {
            genSql = "";
            autorSql = "";
            final = "";
           // runFilter();
        }

    }
    protected void Select_Gen(object sender, EventArgs e)
    {
        string genSelected = "";
        try
        {
            if (Repeater2.Items.Count > 0)
            {
                for (int count = 0; count < Repeater2.Items.Count; count++)
                {
                    CheckBox genuri = (CheckBox)Repeater2.Items[count].FindControl("Genuri");
                    if (genuri.Checked)
                    {
                        if (genSelected != "")
                        {
                            genSelected = genSelected + ", ";
                        }
                        genSelected = genSelected + "'" + genuri.Text + "'";
                    }
                }
            }
            if (genSelected != "")
            {
                genSql = "AND Genuri.Gen IN (" + genSelected + ")";
            }
            else
            {
                genSql = "";
            }
            runFilter();

        }
        catch (Exception err)
        {
            Response.Write(err);
        }
    }
    protected void Select_Autor(object sender, EventArgs e)
    {
        string autorSelected = "";
        try
        {
            if (Repeater1.Items.Count > 0)
            {
                for (int count = 0; count < Repeater1.Items.Count; count++)
                {
                    CheckBox genuri = (CheckBox)Repeater1.Items[count].FindControl("NumeAutor");
                    if (genuri.Checked)
                    {
                        if (autorSelected != "")
                        {
                            autorSelected = autorSelected + ", ";
                        }
                        autorSelected = autorSelected + "'" + genuri.Text + "'";
                    }
                }
            }
            if (autorSelected != "")
            {
                autorSql = "AND Autori.Prenume + ' ' + Autori.Nume IN (" + autorSelected + ")";
            }
            else
            {
                autorSql = "";
            }
            runFilter();

        }
        catch (Exception err)
        {
            Response.Write(err);
        }
    }

    private void BindRepeater(string comandaSql)
    {
        //Do your database connection stuff and get your data
        
        SqlConnection cn = ConnectionFactory.getNewSqlConnection();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        cmd.CommandText = comandaSql;
        //save the result in data table
        DataTable dt = new DataTable();
        ad.SelectCommand = cmd;
        ad.Fill(dt);

        //Create the PagedDataSource that will be used in paging
        PagedDataSource pgitems = new PagedDataSource();
        pgitems.DataSource = dt.DefaultView;
        pgitems.AllowPaging = true;

        //Control page size from here 
        pgitems.PageSize = 20;
        pgitems.CurrentPageIndex = PageNumber;
        if (pgitems.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList pages = new ArrayList();
            for (int i = 0; i <= pgitems.PageCount - 1; i++)
            {
                pages.Add((i + 1).ToString());
            }
            rptPaging.DataSource = pages;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }

        //Finally, set the datasource of the repeater
        Repeater3.DataSource = pgitems;
        Repeater3.DataBind();
    }

    //This method will fire when clicking on the page no link from the pager repeater
    protected void rptPaging_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        BindRepeater(defaultSql);
    }
}