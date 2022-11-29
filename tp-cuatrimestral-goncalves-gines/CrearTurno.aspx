<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearTurno.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.CrearTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function seleccionarUno() {
            $("input:radio").attr("name", "new_name");
        }
    </script>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <label class="TituloABM">Nuevo Turno</label>
                <% if (!permiso()) { %>
            <div class="row g-3" style="justify-content:center">
                <%if (dgvSeleccionarPaciente.SelectedIndex == -1)
                    { %>
                <div class="col-md-2">
                    <label class="form-label">Buscar Paciente</label>
                    <asp:TextBox ID="txtPaciente" AutoPostBack="true" class="form-control"  runat="server" OnTextChanged="txtPaciente_TextChanged"></asp:TextBox>
                </div>
                <asp:GridView ID="dgvSeleccionarPaciente" runat="server" CssClass="table align-middle table-hover table-sm" AutoGenerateColumns="false" DataKeyNames="Id" EmptyDataText="No hay resultados!" OnSelectedIndexChanged="dgvSeleccionarPaciente_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="id"  Visible="false" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:CommandField ButtonType="Button" SelectText="Elegir" ShowSelectButton="true" HeaderText="Accion" ControlStyle-CssClass="btn btn-primary" />
                    </Columns>
                </asp:GridView>
                <% }
                    else
                    {  %>
                 <div class="col-md-2">
                    <label class="form-label">Buscar Especialidad</label>
                    <asp:TextBox ID="txtEspecialidad" AutoPostBack="true" class="form-control"  runat="server" placeholder="" OnTextChanged="txtEspecialidad_TextChanged"></asp:TextBox>
                </div>
                 <asp:GridView ID="dgvSeleccionarEspecialidad" runat="server" CssClass="table align-middle table-hover table-sm" AutoGenerateColumns="false" DataKeyNames="Id" EmptyDataText="No hay resultados!" OnSelectedIndexChanged="dgvSeleccionarEspecialidad_SelectedIndexChanged">
                    <Columns>
                         <asp:BoundField DataField="id"  Visible="false" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:CommandField ButtonType="Button" SelectText="Elegir" ShowSelectButton="true" HeaderText="Accion" ControlStyle-CssClass="btn btn-primary" />
                    </Columns>
                </asp:GridView>
            </div>
                <% } %>>

                 <% } %>
                <% else{ %>
            <div class="row g-3" style="justify-content:center">
                 <div class="col-md-2">
                    <label class="form-label">Fechas disponibles</label>
                    <asp:TextBox ID="txtFecha" TextMode="Date" class="form-control" ClientIDMode="Static"  runat="server" placeholder=""></asp:TextBox>
                </div>
                 <div class="col-md-2">
                    <label class="form-label">Horarios disponibles</label>
                    <asp:TextBox ID="txtHorario" TextMode="Time" format="hh" class="form-control" ClientIDMode="Static"  runat="server" placeholder=""></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <label class="form-label">Medico</label>
                    <asp:DropDownList ID="txtMedico" class="form-control"  runat="server" placeholder=""></asp:DropDownList>
                </div>
                 <div class="col-4 mt-4">
                        <asp:Button ID="Aceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary " OnClick="Aceptar_Click" />
                </div>

                <div id="container">
                    <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-primary btn-lg" OnClick="btnVolver_Click" />
                </div>

            </div>
                <% }  %>
         </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>
