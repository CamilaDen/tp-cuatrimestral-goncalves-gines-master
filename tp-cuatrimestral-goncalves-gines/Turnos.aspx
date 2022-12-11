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
                            <asp:Label Text="Filtrar por paciente" runat="server" />
                            <asp:TextBox runat="server" AutoCompleteType="LastName" ID="txtFiltro" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="mb-3">
                            <asp:Label Text="Estado" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control" TabIndex="1">
                                <asp:ListItem Text="Todos" />
                                <asp:ListItem Text="Activo" />
                                <asp:ListItem Text="Inactivo" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-4 mt-4">
                        <asp:Button ID="btnBuscarRapido" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscarRapido_Click" TabIndex="2" />
                    </div>
                    <div class="col-2 mt-4">
                        <asp:Button ID="bntCrear" runat="server" Text="📅   Nuevo" CssClass="btn btn-success btn-block" OnClick="btnCrear_Click" TabIndex="3" />
                    </div>
                </div>
                <asp:GridView ID="dgvPacientesTurnos" runat="server" EmptyDataText="No hay resultados!" CssClass="table align-middle table-sm" 
                    AutoGenerateColumns="false" AutoPostBack="true" DataKeyNames="Id" 
                    OnPageIndexChanging="dgvPacientesTurnos_PageIndexChanging"
                    AllowPaging="true" PageSize="8"
                    OnSelectedIndexChanged="dgvPacientesTurnos_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Nro Turno" DataField="ID" />
                        <asp:BoundField HeaderText="Apellido" DataField="Paciente.Nombre" />
                        <asp:BoundField HeaderText="Nombre" DataField="Paciente.Apellido" />
                        <asp:BoundField HeaderText="DNI" DataField="Paciente.Dni" />
                        <asp:BoundField HeaderText="Especialidad" DataField="Especialidad.Nombre" />
                        <asp:BoundField HeaderText="Fecha Solicitud" DataFormatString="{0:dd/MM/yyyy}" DataField="FechaSolicitado" />
                        <asp:BoundField HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" DataField="Fecha" />
                        <asp:BoundField HeaderText="Hora" DataFormatString="{0:00}" DataField="Hora" />
                        <asp:BoundField HeaderText="Medico" DataField="Medico.Apellido" />
                        <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" />
                        <asp:BoundField HeaderText="Estado" DataField="Estado.Nombre" />
                        <asp:CommandField HeaderText="Seleccionar" SelectText="✔️" ShowSelectButton="true" ControlStyle-CssClass="btn bnt-success btn-light" />
                    </Columns>
                    <EditRowStyle Font-Size="Small" />
                    <FooterStyle BackColor="#666666" Font-Size="Small" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#333333" ForeColor="White" />
                    <RowStyle HorizontalAlign="Center" CssClass="GvGrid"/>
                    <HeaderStyle HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="YellowGreen" font-bold="true" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                </asp:GridView>
                <div Class="row" style="display:flex;">
                     <div class="col-5" style="display:inline-flex">
                         <div class="mb-3">
                            <label style="font-weight:bold">Acciones:</label>
                         </div>
                         <div class="mb-4">
                           <label style="color:grey;">(seleccione un turno de la grilla para habilitar)</label>
                        </div>
                    </div>
                     <div class="col-2" style="display:flex; float:right">
                        <div class="mb-2">
                            <asp:Button ID="btnVer" runat="server" Text="🔍 Ver Detalle" CssClass="btn btn-primary" OnClick="btnVer_Click" />
                        </div>
                    </div>
                     <div class="col-2" style="display:flex;float:right">
                        <div class="mb-2">
                            <asp:Button ID="btnReagendar" runat="server" Text="📋 Reagendar" CssClass="btn btn-primary" OnClick="btnReagendar_Click" />
                        </div>
                    </div>
                     <div class="col-2" style="display:flex; float:right;">
                        <div class="mb-2">
                            <asp:Button ID="btnCancelar" runat="server" Text="❌ Cancelar" AutoPostback="true" CssClass="btn btn-primary" OnClick="btnCancelar_Click" />
                        </div>
                    </div>
                </div>
                <hr />
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="container">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="⬅️   Volver" class="btn btn-secondary btn-lg" OnClick="btnVolver_Click" TabIndex="4" />
        </div>
    </div>
</asp:Content>
