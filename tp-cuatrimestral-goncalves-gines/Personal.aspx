<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Personal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h1>Personal</h1>
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
                <asp:GridView ID="dgvPersonal" runat="server" CssClass="table align-middle table-hover table-sm" AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvPersonal_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="Id" />
                        <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:BoundField HeaderText="DNI" DataField="Dni" />
                        <asp:BoundField HeaderText="Mail" DataField="Mail" />
                        <asp:BoundField HeaderText="Fec. Nac." DataFormatString="{0:d}" DataField="FechaDeNacimiento" />
                        <asp:BoundField HeaderText="Perfil" DataField="Usuario.Perfil.Nombre" />
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
