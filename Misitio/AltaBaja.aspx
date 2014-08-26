<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AltaBaja.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Dar de baja o Alta articulos de categoria<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id_art" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id_art" HeaderText="id_art" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id_art" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" 
                    SortExpression="descripcion" />
                <asp:BoundField DataField="unidad" HeaderText="unidad" 
                    SortExpression="unidad" />
                <asp:BoundField DataField="precio" HeaderText="precio" 
                    SortExpression="precio" />
                <asp:BoundField DataField="id_cat" HeaderText="id_cat" 
                    SortExpression="id_cat" />
                <asp:BoundField DataField="estado" HeaderText="estado" 
                    SortExpression="estado" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ventaConnectionString %>" 
            SelectCommand="SELECT * FROM [articulo]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
    
    </div>
    <p>
        Seleccionar Categoria:&nbsp;&nbsp;
        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id_cat">
        </asp:ListBox>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ventaConnectionString %>" 
            SelectCommand="SELECT * FROM [categoria]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Dar de Baja" />
&nbsp;
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
            Text="Dar de Alta" />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ventaConnectionString %>" 
            SelectCommand="SELECT * FROM [articulo]" 
            UpdateCommand="UPDATE articulo SET estado='baja' where id_cat=@idcat">
            <UpdateParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="idcat" 
                    PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ventaConnectionString %>" 
            SelectCommand="SELECT * FROM [articulo]" 
            UpdateCommand="UPDATE articulo SET estado='alta' where id_cat=@idcat">
            <UpdateParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="idcat" 
                    PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    </form>
    </body>
</html>
