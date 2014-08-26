<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>VENTAS DE ARTICULOS</b><br />
    
    </div>
    <p>
        SELECCINAR CATEGORIA
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id_cat">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ventaConnectionString %>" 
            SelectCommand="SELECT * FROM [categoria]"></asp:SqlDataSource>
    </p>
    <p>
        SELECCIONAR ARTICULO</p>
    <p>
&nbsp;<asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="descripcion" 
            DataValueField="id_art" onselectedindexchanged="ListBox1_SelectedIndexChanged" 
            Width="281px"></asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ventaConnectionString %>" 
            SelectCommand="SELECT * FROM [articulo] where id_cat=@idcat">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="idcat" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <table style="width:60%;">
        <tr>
            <td>
                CODIGO</td>
            <td>
                ARTICULO</td>
            <td>
                CANTIDAD</td>
            <td>
                PRECIO</td>
            <td>
                TOTAL</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem>&gt;&gt;SELECCIONAR&lt;&lt;</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" 
        Width="725px" AutoGenerateColumns="False" DataKeyNames="id_art">
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
    </form>
</body>
</html>
