<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IngresarArticulos.aspx.cs" Inherits="IngresarArticulos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 616px;
        }
        .style2
        {
            width: 265px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        FORMULARIO INGRESO ARTICULO<br />
        <br />
        <table style="width: 41%;">
            <tr>
                <td class="style2">
                    Descripción</td>
                <td class="style1">
                    <asp:TextBox ID="des" runat="server" Width="178px"></asp:TextBox>
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Categoria</td>
                <td class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id_cat">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ventaConnectionString %>" 
                        SelectCommand="SELECT * FROM [categoria]"></asp:SqlDataSource>
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Unidad</td>
                <td class="style1">
                    <asp:TextBox ID="uni" runat="server" Width="67px"></asp:TextBox>
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Precio</td>
                <td class="style1">
                    <asp:TextBox ID="pre" runat="server" Width="66px"></asp:TextBox>
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
                <td class="style1">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Insertar" />
                </td>
            </tr>
        </table>
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ventaConnectionString %>" 
        InsertCommand="INSERT INTO articulo(descripcion,unidad,precio,id_cat) values (@des,@uni,@pre,@idcat)" 
        SelectCommand="SELECT * FROM [articulo]">
        <InsertParameters>
            <asp:ControlParameter ControlID="des" Name="des" PropertyName="Text" />
            <asp:ControlParameter ControlID="uni" Name="uni" PropertyName="Text" />
            <asp:ControlParameter ControlID="pre" Name="pre" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList1" Name="idcat" 
                PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
