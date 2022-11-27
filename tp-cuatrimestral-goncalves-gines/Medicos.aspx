<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Medicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Médicos</h1>
        <asp:GridView ID="dgvMedicos" runat="server" CssClass="table" AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvMedicos_SelectedIndexChanged">
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="Id" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="DNI" DataField="Dni" />
                <asp:BoundField HeaderText="Mail" DataField="Mail" />
                <asp:BoundField HeaderText="Fec. Nac." DataFormatString="{0:d}" DataField="FechaDeNacimiento" />
                <asp:BoundField HeaderText="Matricula" DataField="Matricula" />
                <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
                <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="✏️​" ControlStyle-CssClass="btn btn-primary" />
            </Columns>
        </asp:GridView>
        <div id="botoncitos">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color: black; border-style: none" OnClick="btnVolver_Click" />
            <asp:Button ID="btnCrear" runat="server" Text="Crear" class="btn btn-primary btn-lg" Style="background-color: #5dbf4a; color: black; border-style: none" OnClick="btnCrear_Click" />
        </div>
    </div>
</asp:Content>
