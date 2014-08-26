using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource3.Update();
        Response.Redirect("AltaBaja.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataSource4.Update();
        Response.Redirect("AltaBaja.aspx");
    }
}