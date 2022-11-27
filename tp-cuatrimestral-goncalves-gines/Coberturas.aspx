<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Coberturas.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Cobertura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Coberturas</h1>
        <asp:GridView ID="dgvCoberturas" runat="server" CssClass="table" AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvCoberturas_SelectedIndexChanged">
            <Columns>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Sigla" DataField="Sigla" />
                <asp:BoundField HeaderText="CUIT" DataField="Cuit" />
                <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
                <asp:BoundField HeaderText="Direccion" DataField="Direccion" />
                <asp:BoundField HeaderText="Mail" DataField="Mail" />
                <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
                <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="✏️​" ControlStyle-CssClass="btn btn-primary" />
            </Columns>
        </asp:GridView>
        <div id="botoncitos">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" CssClass="btn btn-secondary btn-lg" OnClick="btnVolver_Click" />
            <asp:Button ID="btnCrear" runat="server" Text="Crear" CssClass="btn btn-success btn-lg" OnClick="btnCrear_Click" />
        </div>
    </div>
</asp:Content>
