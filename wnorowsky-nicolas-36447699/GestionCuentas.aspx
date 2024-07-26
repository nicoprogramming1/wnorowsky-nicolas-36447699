<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="GestionCuentas.aspx.cs" Inherits="wnorowsky_nicolas_36447699.GestionCuentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Descripcion: "></asp:Label>
<asp:TextBox ID="TextBoxDescripcion" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxDescripcion" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
<br />
    <asp:Label ID="Label2" runat="server" Text="Cuentas: "></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCuentasCRUD" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
<br />
<asp:Button ID="ButtonAdd" runat="server" OnClick="ButtonAdd_Click" Text="Add" />
<asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
    <asp:Button ID="ButtonDelete" runat="server" OnClick="ButtonDelete_Click" Text="Delete" />
<asp:Label ID="LabelResult" runat="server"></asp:Label>
<br />
<br />
    <asp:SqlDataSource ID="SqlDataSourceCuentasCRUD" runat="server" ConnectionString="<%$ ConnectionStrings:clase4ConnectionString %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
</asp:Content>
