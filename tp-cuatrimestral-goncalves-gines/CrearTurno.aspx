<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearTurno.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.CrearTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--    <script>
        function seleccionarUno() {
            $("input:radio").attr("name", "new_name");
        }
    </script>--%>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <label class="TituloABM">Nuevo Turno</label>
                <% if (!permiso()) { %>
            <div class="row g-3" style="justify-content:left">

                <%if (dgvSeleccionarPaciente.SelectedIndex == -1){ %>

                <div class="row">
                    <label class="form-label" style="font-weight:bold">Seleccione un paciente</label>
                    <asp:TextBox ID="txtPaciente" class="form-control" Style="width:500px; margin-left:15px" placeholder="Nombre Paciente" runat="server"></asp:TextBox>
                    <div class="col-md-2">
                        <asp:Button ID="btnBuscarRapidoPaciente" runat="server" Text="Buscar" CssClass="btn btn-primary " />
                    </div>
                </div>
                <asp:GridView ID="dgvSeleccionarPaciente" runat="server" CssClass="table align-middle table-hover table-sm" AutoGenerateColumns="false" DataKeyNames="Id" EmptyDataText="No hay resultados!" OnSelectedIndexChanged="dgvSeleccionarPaciente_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="id"  Visible="false" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:CommandField ButtonType="Button" SelectText="Elegir" ShowSelectButton="true" HeaderText="Accion" ControlStyle-CssClass="btn btn-success btn-block"  />
                    </Columns>
                </asp:GridView>
                <% } else{  %>
                 <div class="row">
                    <label class="form-label" style="font-weight:bold">Seleccione una especialidad</label>
                    <asp:TextBox ID="txtEspecialidad" class="form-control" Style="width:500px; margin-left:15px" runat="server" placeholder="Nombre Especialidad"></asp:TextBox>
                    <div class="col-md-2">
                        <asp:Button ID="btnBuscarRapidoEspecialidad" runat="server" Text="Buscar" CssClass="btn btn-primary " onClick="btnBuscarRapidoEspecialidad_Click"/>
                    </div>
                 </div>
                 <asp:GridView ID="dgvSeleccionarEspecialidad" runat="server" CssClass="table align-middle table-hover table-sm" Style="justify-content:center" AutoGenerateColumns="false" DataKeyNames="Id" EmptyDataText="No hay resultados!" OnSelectedIndexChanged="dgvSeleccionarEspecialidad_SelectedIndexChanged">
                    <Columns>
                         <asp:BoundField DataField="id"  Visible="false" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                        <asp:CommandField ButtonType="Button" SelectText="Elegir" ShowSelectButton="true" HeaderText="Accion" ControlStyle-CssClass="btn btn-success btn-block" />
                    </Columns>
                </asp:GridView>
            </div>
                    <% } %>

                 <% } %>
                <% else{ %>
            <div class="row g-3" style="justify-content:left">
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
                 <div id="container" style="padding-bottom:25px">
                        <asp:Button ID="Aceptar" runat="server" Text="Aceptar" CssClass="btn btn-success btn-block " OnClick="Aceptar_Click" />
                </div>
            </div>
                <% }  %>
                <div id="container">
                    <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver a Turno" class="btn btn-primary btn-lg" OnClick="btnVolver_Click" />
                </div>
         </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>
