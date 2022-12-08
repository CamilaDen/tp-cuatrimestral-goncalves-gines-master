<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Horarios.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Horarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h1>Horarios</h1>
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
                        <asp:Button ID="btnCrear" runat="server" Text="+ Nuevo" CssClass="btn btn-success btn-block" OnClick="btnCrear_Click" />
                    </div>
                </div>
                <asp:GridView ID="dgvHorarios" runat="server" CssClass="table align-middle table-hover table-sm" EmptyDataText="No hay resultados!" AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvHorarios_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Id" />
                        <asp:BoundField HeaderText="Día" DataField="Dia.Nombre" />
                        <asp:BoundField HeaderText="Hora Desde" DataField="Hora_Desde" />
                        <asp:BoundField HeaderText="Hora Hasta" DataField="Hora_Hasta" />
                        <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
                        <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="✏️​" ControlStyle-CssClass="btn btn-light" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="container">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="⬅️  Volver" CssClass="btn btn-secondary btn-lg" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
