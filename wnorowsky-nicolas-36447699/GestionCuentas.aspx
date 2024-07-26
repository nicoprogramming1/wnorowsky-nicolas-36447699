<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="GestionCuentas.aspx.cs" Inherits="wnorowsky_nicolas_36447699.GestionCuentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Descripcion: "></asp:Label>
<asp:TextBox ID="TextBoxDescripcion" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxDescripcion" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Button ID="ButtonAdd" runat="server" OnClick="ButtonAdd_Click" Text="Add" />
<asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
<asp:Label ID="LabelResult" runat="server"></asp:Label>
<br />
<br />
<asp:GridView ID="GridViewCuentas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceCuentasCRUD" OnSelectedIndexChanged="GridViewCuentas_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowSelectButton="True" />
    </Columns>
    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#330099" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
    <SortedAscendingCellStyle BackColor="#FEFCEB" />
    <SortedAscendingHeaderStyle BackColor="#AF0101" />
    <SortedDescendingCellStyle BackColor="#F6F0C0" />
    <SortedDescendingHeaderStyle BackColor="#7E0000" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceCuentasCRUD" runat="server" ConnectionString="<%$ ConnectionStrings:clase4ConnectionString %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
    <DeleteParameters>
        <asp:ControlParameter ControlID="GridViewCuentas" Name="id" PropertyName="SelectedValue" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="TextBoxDescripcion" Name="descripcion" PropertyName="Text" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="TextBoxDescripcion" Name="descripcion" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="GridViewCuentas" Name="id" PropertyName="SelectedValue" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
