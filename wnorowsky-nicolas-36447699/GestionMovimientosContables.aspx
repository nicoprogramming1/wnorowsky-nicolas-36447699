<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="GestionMovimientosContables.aspx.cs" Inherits="wnorowsky_nicolas_36447699.GestionMovimientosContables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Fecha: "></asp:Label>
<asp:TextBox ID="TextBoxFecha" runat="server" TextMode="Date"></asp:TextBox>
<br />
<asp:Label ID="Label2" runat="server" Text="Monto: "></asp:Label>
<asp:TextBox ID="TextBoxMonto" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxMonto" ErrorMessage="Monto requerido" ForeColor="Red"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxMonto" ErrorMessage="Monto inválido" ForeColor="Red" ValidationExpression="^\d+(\.\d{1,2})?$"></asp:RegularExpressionValidator>
<br />
<asp:Label ID="Label3" runat="server" Text="Tipo: "></asp:Label>
<asp:TextBox ID="TextBoxTipo" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxTipo" ErrorMessage="Tipo inválido, debe ser D o H" ForeColor="Red" ValidationExpression="^[DH]$"></asp:RegularExpressionValidator>
<br />
<asp:Label ID="Label4" runat="server" Text="Cuenta: "></asp:Label>
<asp:DropDownList ID="DropDownListCuentas" runat="server" DataSourceID="SqlDataSourceCuentas" DataTextField="descripcion" DataValueField="id"></asp:DropDownList>

<br />
<br />
<asp:Button ID="ButtonAdd" runat="server" Text="Add" OnClick="ButtonAdd_Click" />
<asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
<asp:Label ID="LabelResult" runat="server"></asp:Label>
<br />
<br />
<asp:Label ID="Label5" runat="server" Text="Filtrar por cuenta: "></asp:Label>
<asp:DropDownList ID="DropDownListFiltro" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCuentas" DataTextField="descripcion" DataValueField="id">
</asp:DropDownList>
<asp:Button ID="ButtonFilter" runat="server" OnClick="ButtonFilter_Click" Text="Filter" />
<asp:Button ID="ButtonUnfilter" runat="server" OnClick="ButtonUnfilter_Click" Text="Unfilter" />
<br />
<asp:GridView ID="GridViewMovimientos" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSourceMovimientosCRUD" ForeColor="Black" OnSelectedIndexChanged="GridViewMovimientos_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
        <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
        <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
        <asp:BoundField DataField="idCuenta" HeaderText="idCuenta" SortExpression="idCuenta" />
        <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowSelectButton="True" />
    </Columns>
    <FooterStyle BackColor="#CCCCCC" />
    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
    <RowStyle BackColor="White" />
    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="Gray" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#383838" />
</asp:GridView>
<br />
<asp:SqlDataSource ID="SqlDataSourceMovimientosCRUD" runat="server" ConnectionString="<%$ ConnectionStrings:clase4ConnectionString %>" DeleteCommand="DELETE FROM [MovimientosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [MovimientosContables] ([fecha], [monto], [tipo], [idCuenta]) VALUES (@fecha, @monto, @tipo, @idCuenta)" SelectCommand="SELECT m.id, m.fecha, m.monto, m.tipo, m.idCuenta as idCuenta, c.descripcion
FROM MovimientosContables m
INNER JOIN Cuentas c ON m.idCuenta = c.id" UpdateCommand="UPDATE [MovimientosContables] SET [fecha] = @fecha, [monto] = @monto, [tipo] = @tipo, [idCuenta] = @idCuenta WHERE [id] = @id">
    <DeleteParameters>
        <asp:ControlParameter ControlID="GridViewMovimientos" Name="id" PropertyName="SelectedValue" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBoxFecha" DbType="Date" Name="fecha" PropertyName="Text" />
        <asp:ControlParameter ControlID="TextBoxMonto" Name="monto" PropertyName="Text" Type="Decimal" />
        <asp:ControlParameter ControlID="TextBoxTipo" Name="tipo" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="DropDownListCuentas" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="TextBoxFecha" DbType="Date" Name="fecha" PropertyName="Text" />
        <asp:ControlParameter ControlID="TextBoxMonto" Name="monto" PropertyName="Text" Type="Decimal" />
        <asp:ControlParameter ControlID="TextBoxTipo" Name="tipo" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="DropDownListCuentas" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="GridViewMovimientos" Name="id" PropertyName="SelectedValue" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceCuentas" runat="server" ConnectionString="<%$ ConnectionStrings:clase4ConnectionString %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
</asp:Content>
