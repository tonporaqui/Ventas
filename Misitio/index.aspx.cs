using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int fila = ListBox1.SelectedIndex;
        Label1.Text = GridView1.Rows[fila].Cells[0].Text;
        Label2.Text = GridView1.Rows[fila].Cells[1].Text;
        Label3.Text = GridView1.Rows[fila].Cells[3].Text;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        long precio = Convert.ToInt64(Label3.Text);
        long cantidad = Convert.ToInt64(DropDownList2.SelectedValue);
        long total = precio * cantidad;
        Label4.Text = Convert.ToString(total);
    }
}