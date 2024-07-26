<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="MostrarCuentas.aspx.cs" Inherits="wnorowsky_nicolas_36447699.MostrarCuentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="idCuenta" DataSourceID="SqlDataSource1" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="idCuenta" HeaderText="idCuenta" InsertVisible="False" ReadOnly="True" SortExpression="idCuenta" />
            <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
            <asp:BoundField DataField="Saldo" HeaderText="Saldo" ReadOnly="True" SortExpression="Saldo" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:clase4ConnectionString %>" SelectCommand="SELECT 
    c.id AS idCuenta,
    c.descripcion, 
    SUM(m.monto * CASE WHEN m.tipo = 'D' THEN 1 ELSE -1 END) AS Saldo
FROM MovimientosContables m
INNER JOIN Cuentas c ON m.idCuenta = c.id
GROUP BY c.id, c.descripcion;

"></asp:SqlDataSource>
</asp:Content>
