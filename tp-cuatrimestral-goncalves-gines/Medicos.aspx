<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Medicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h1>Médicos</h1>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-3">
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
                    <div class="col-2 mt-4">
                        <div class="mb-3">
                            <asp:Button ID="btnBuscarRapido" runat="server" Text="Buscar" CssClass="btn btn-primary " OnClick="btnBuscarRapido_Click" />
                        </div>
                    </div>
                    <div class="col-3 mt-4" style="display: flex; flex-direction: column; justify-content: flex-end;">
                        <div class="mb-3">
                            <asp:CheckBox Text="Filtro Avanzado" CssClass="" ID="chkFiltroAvanzado" runat="server" AutoPostBack="true" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" />
                        </div>
                    </div>
                    <div class="col-2 mt-4" style="display: flex; flex-direction: column; justify-content: flex-end;">
                        <div class="mb-3">
                            <asp:Button ID="btnCrear" runat="server" Text="+ Nuevo" CssClass="btn btn-success btn-block" OnClick="btnCrear_Click" />
                        </div>
                    </div>
                </div>
                <% if (chkFiltroAvanzado.Checked)
                    { %>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Campo" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlCampo" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                                <asp:ListItem Text="Nombre" />
                                <asp:ListItem Text="Apellido" />
                                <asp:ListItem Text="DNI" />
                                <asp:ListItem Text="Mail" />
                                <asp:ListItem Text="Fecha de Nacimiento" />
                                <asp:ListItem Text="Matrícula" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Criterio" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Filtro" runat="server" />
                            <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" OnTextChanged="txtFiltroAvanzado_TextChanged" AutoPostBack="true" />
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3 mt-4">
                            <asp:Button ID="btnBuscarAvanzado" runat="server" Text="Buscar" CssClass="btn btn-primary " OnClick="btnBuscarAvanzado_Click" />
                        </div>
                    </div>
                </div>
                <% }%>
                <asp:GridView ID="dgvMedicos" runat="server" CssClass="table align-middle table-hover table-sm" EmptyDataText="No hay resultados!" AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvMedicos_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="DNI" DataField="Dni" />
                        <asp:BoundField HeaderText="Mail" DataField="Mail" />
                        <asp:BoundField HeaderText="Fec. Nac." DataFormatString="{0:d}" DataField="FechaDeNacimiento" />
                        <asp:BoundField HeaderText="Matrícula" DataField="Matricula" />
                        <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
                        <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="✏️​" ControlStyle-CssClass="btn btn-light" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="container">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" CssClass="btn btn-secondary btn-lg" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
