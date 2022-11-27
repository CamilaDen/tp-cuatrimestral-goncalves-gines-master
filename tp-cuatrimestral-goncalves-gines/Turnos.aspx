<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Turnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <label class="TituloABM">Turnos</label>
        <div class="col-md-8">
            <label class="form-label">Buscar Paciente</label>
            <asp:TextBox ID="txtBuscarPaciente" class="form-control" TextMode="Search"  runat="server" placeholder=""></asp:TextBox>  
         </div>
        <asp:GridView ID="dgvPacientesTurnos" runat="server" CssClass="table" AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvPacientesTurnos_SelectedIndexChanged">
            <Columns>
                <asp:BoundField HeaderText="Numero" DataField="Numero" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Apellido" DataField="Apellido" /> 
                <asp:BoundField HeaderText="Estado" DataField="Estado" />
                <asp:CommandField HeaderText="Consultar Turno" ShowSelectButton="true" /> 
            </Columns>
        </asp:GridView>
     
        <div id="botoncitos">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color:black; border-style:none" OnClick="btnVolver_Click"/>
            <asp:Button ID="btnConsulta" runat="server" Text="Consulta" class="btn btn-primary btn-lg" Style="background-color: #5dbf4a; color: black; border-style: none" OnClick="btnConsulta_Click" />     
            <asp:Button ID="btnCrear" runat="server" Text="Crear" class="btn btn-primary btn-lg" Style="background-color: #5dbf4a; color:black; border-style:none" OnClick="btnCrear_Click"/>
        </div>

    </div>
</asp:Content>
