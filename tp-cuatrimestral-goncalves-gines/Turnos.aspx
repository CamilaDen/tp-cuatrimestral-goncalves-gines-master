﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Turnos" %>

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
                <asp:GridView ID="dgvPacientesTurnos" runat="server" EmptyDataText="No hay resultados!" CssClass="table align-middle table-sm" AutoGenerateColumns="false" AutoPostBack="true" DataKeyNames="Id" OnSelectedIndexChanged="dgvPacientesTurnos_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Nro Turno" DataField="ID" />
                        <asp:BoundField HeaderText="Apellido" DataField="Paciente.Nombre" />
                        <asp:BoundField HeaderText="Nombre" DataField="Paciente.Apellido" />
                        <asp:BoundField HeaderText="Especialidad" DataField="Especialidad.Nombre" />
                        <asp:BoundField HeaderText="Fecha Solicitud" DataFormatString="{0:dd/MM/yyyy}" DataField="FechaSolicitado" />
                        <asp:BoundField HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" DataField="Fecha" />
                        <asp:BoundField HeaderText="Hora" DataFormatString="{0:00}" DataField="Hora" />
                        <asp:BoundField HeaderText="Medico" DataField="Medico.Apellido" />
                        <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" />
                        <asp:BoundField HeaderText="Estado" DataField="Estado.Nombre" />
                        <asp:CommandField HeaderText="Ver Detalle" SelectText="🔍 ​" ShowSelectButton="true" ControlStyle-CssClass="btn btn-success btn-light" />
                    </Columns>
                    <EditRowStyle Font-Size="Small" />
                    <FooterStyle BackColor="#666666" Font-Size="Small" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#333333" ForeColor="White" />
                    <RowStyle HorizontalAlign="Center" CssClass="GvGrid"/>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="container">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="⬅️   Volver" class="btn btn-secondary btn-lg" OnClick="btnVolver_Click" TabIndex="4" />
            <%--<asp:Button ID="btnConsulta" runat="server" Text="Consulta" class="btn btn-primary btn-lg" Style="background-color: #5dbf4a; color: black; border-style: none" OnClick="btnConsulta_Click" />--%>
            <%--<asp:Button ID="btnCrear" runat="server" Text="Crear" class="btn btn-primary btn-lg" Style="background-color: #5dbf4a; color:black; border-style:none" OnClick="btnCrear_Click"/>--%>
        </div>

    </div>
</asp:Content>
