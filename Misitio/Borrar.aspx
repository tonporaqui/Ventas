<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Borrar.aspx.cs" Inherits="Borrar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 109px;
        }
        .style2
        {
            width: 79px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Borrar un articulo<br />
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
            SelectCommand="SELECT * FROM [articulo] where estado = 'baja'">
        </asp:SqlDataSource>
        <br />
        <table style="width: 35%;">
            <tr>
                <td class="style1">
                    Codigo a borrar</td>
                <td class="style2">
                    <asp:TextBox ID="del" runat="server" Width="60px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Borrar" />
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ventaConnectionString %>" 
            DeleteCommand="DELETE FROM articulo where id_art = @del" 
            SelectCommand="SELECT * FROM [articulo]">
            <DeleteParameters>
                <asp:ControlParameter ControlID="del" Name="del" PropertyName="Text" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
