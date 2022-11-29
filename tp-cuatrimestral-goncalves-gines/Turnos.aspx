<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Turnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <label class="TituloABM">Turnos</label>
         <asp:UpdatePanel runat="server">
             <ContentTemplate>
                <div class="row">
                    <div class="col-4">
                        <div class="mb-3">
                            <asp:Label Text="Filtrar" runat="server" />
                            <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="mb-3">
                            <asp:Label Text="Estado" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                                <asp:ListItem Text="Todos" />
                                <asp:ListItem Text="Activo" />
                                <asp:ListItem Text="Inactivo" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-4 mt-4">
                        <asp:Button ID="btnBuscarRapido" runat="server" Text="Buscar" CssClass="btn btn-primary " OnClick="btnBuscarRapido_Click" />
                    </div>
                    <div class="col-2 mt-4">
                        <asp:Button ID="Button1" runat="server" Text="+ Nuevo" CssClass="btn btn-success btn-block" OnClick="btnCrear_Click" />
                    </div>
                </div>
                 <asp:GridView ID="dgvPacientesTurnos" runat="server" EmptyDataText="No hay resultados!" CssClass="table" AutoGenerateColumns="false" AutoPostBack="true" DataKeyNames="Id" OnSelectedIndexChanged="dgvPacientesTurnos_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Numero" DataField="ID" />
                        <asp:BoundField HeaderText="Apellido" DataField="IdPaciente.Nombre" /> 
                        <asp:BoundField HeaderText="Nombre" DataField="IdPaciente.Apellido" />
                        <asp:BoundField HeaderText="Especialidad" DataField="Especialidad.Nombre" />
                        <asp:BoundField HeaderText="Fecha Solicitud" DataFormatString="{0:d}" DataField="FechaSolicitado" />
                        <asp:BoundField HeaderText="Fecha" DataFormatString="{0:d}" DataField="Fecha" />
                        <asp:BoundField HeaderText="Hora" DataField="Hora" />
                        <asp:BoundField HeaderText="Medico" DataField="IdMedico.Apellido" />
                        <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" />
                        <asp:BoundField HeaderText="Estado" DataField="Estado" />
                        <asp:CommandField HeaderText="Consultar Turno" SelectText="🔍" ShowSelectButton="true" ControlStyle-CssClass="btn btn-primary" /> 
                    </Columns>
                 </asp:GridView>
             </ContentTemplate>
        </asp:UpdatePanel>
        <div id="container">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-secondary btn-lg" OnClick="btnVolver_Click"/>
            <%--<asp:Button ID="btnConsulta" runat="server" Text="Consulta" class="btn btn-primary btn-lg" Style="background-color: #5dbf4a; color: black; border-style: none" OnClick="btnConsulta_Click" />--%>     
            <%--<asp:Button ID="btnCrear" runat="server" Text="Crear" class="btn btn-primary btn-lg" Style="background-color: #5dbf4a; color:black; border-style:none" OnClick="btnCrear_Click"/>--%>
        </div>

    </div>
</asp:Content>
