<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        LISTAR ARTICULOS DE BODEGA<br />
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
    
    </div>
    </form>
</body>
</html>
