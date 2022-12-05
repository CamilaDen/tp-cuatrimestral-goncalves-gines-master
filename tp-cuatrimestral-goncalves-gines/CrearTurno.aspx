<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearTurno.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.CrearTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function validar() {
            // acá estamos usando JS puro, pero concatenando con una sentencia de C# embebido para obtener el Id del control, al que le agregamos la propiedad ClientIDMode.
            var txtObservacion = document.getElementById("txtObservacion").value;
            var valido = true;
            // luego evalulamos
            if (txtObservacion === "") {
                $("#txtObservacion").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtObservacion").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message").addClass("d-none").removeClass("d-block");
            }         
            return valido;
        }
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <label class="TituloABM">Nuevo Turno</label>
                <% if (!permiso() && !turnoSeleccionado())
                    { %>
                <div class="row g-3" style="justify-content: left">
                    <%if (dgvSeleccionarPaciente.SelectedIndex == -1)
                        { %>
                    <div class="row">
                        <label class="form-label" style="font-weight: bold">Seleccione un paciente</label>
                        <asp:TextBox ID="txtPaciente" class="form-control" Style="width: 500px; margin-left: 15px" placeholder="Nombre Paciente" runat="server"></asp:TextBox>
                        <div class="col-md-2">
                            <asp:Button ID="btnBuscarRapidoPaciente" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscarRapido_Click" />
                        </div>
                    </div>
                    <asp:GridView ID="dgvSeleccionarPaciente" runat="server" CssClass="table align-middle table-sm" AutoGenerateColumns="false" DataKeyNames="Id" EmptyDataText="No hay resultados!" OnSelectedIndexChanged="dgvSeleccionarPaciente_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:BoundField HeaderText="DNI" DataField="Dni" />
                            <asp:CommandField ButtonType="Button" SelectText="✔️ " ShowSelectButton="true" HeaderText="Elegir" ControlStyle-CssClass="btn btn-success btn-light" />
                        </Columns>
                        <EditRowStyle Font-Size="Small" />
                        <FooterStyle BackColor="#666666" Font-Size="Small" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                        <RowStyle HorizontalAlign="Center" CssClass="GvGrid" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <% }
                        else
                        {  %>
                    <div class="row">
                        <label class="form-label" style="font-weight: bold">Seleccione una especialidad</label>
                        <asp:TextBox ID="txtEspecialidad" class="form-control" Style="width: 500px; margin-left: 15px" runat="server" placeholder="Nombre Especialidad"></asp:TextBox>
                        <div class="col-md-2">
                            <asp:Button ID="btnBuscarRapidoEspecialidad" runat="server" Text="Buscar" CssClass="btn btn-primary " OnClick="btnBuscarRapidoEspecialidad_Click" />
                        </div>
                    </div>
                    <asp:GridView ID="dgvSeleccionarEspecialidad" runat="server" CssClass="table align-middle table-sm" Style="justify-content: center" AutoGenerateColumns="false" DataKeyNames="Id" EmptyDataText="No hay resultados!" OnSelectedIndexChanged="dgvSeleccionarEspecialidad_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="id" Visible="false" />
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                            <asp:CommandField ButtonType="Button" SelectText="✔️ " ShowSelectButton="true" HeaderText="Elegir" ControlStyle-CssClass="btn btn-success btn-light" />
                        </Columns>
                        <EditRowStyle Font-Size="Small" />
                        <FooterStyle BackColor="#666666" Font-Size="Small" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#333333" ForeColor="White" />
                        <RowStyle HorizontalAlign="Center" CssClass="GvGrid" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
                <% } %>

                <% } %>
                <% else
                    { %>
                <div class="row">
                    <asp:Label ID="lblSeleccionMedico" runat="server" Text="Seleccione un médico y horario" CssClass="form-label" style="font-weight: bold"></asp:Label>
                </div>
                <asp:GridView ID="dgvTurnosPropuestos" runat="server" Visible="true" CssClass="table align-middle table-sm" AutoGenerateColumns="false" DataKeyNames="Id" EmptyDataText="No hay resultados!" OnSelectedIndexChanged="dgvTurnosPropuestos_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Apellido" DataField="Medico.Apellido" />
                        <asp:BoundField HeaderText="Nombre" DataField="Medico.Nombre" />
                        <asp:BoundField HeaderText="Hora" DataFormatString="{0:00}" DataField="Hora" />
                        <asp:BoundField HeaderText="Dia" DataFormatString="{0:dd/MM/yyyy}" DataField="Fecha" />
                        <asp:CommandField ButtonType="Button" SelectText="✔️ " ShowSelectButton="true" HeaderText="Elegir" ControlStyle-CssClass="btn btn-success btn-light" />
                    </Columns>
                    <EditRowStyle Font-Size="Small" />
                    <FooterStyle BackColor="#666666" Font-Size="Small" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#333333" ForeColor="White" />
                    <RowStyle HorizontalAlign="Center" CssClass="GvGrid" />
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:GridView>
                <% if (turnoSeleccionado())
                    { %>
                <div id="idDatosSeleccionadosParaTurno" class="container">
                    <label class="SubTituloABM">Paciente</label>
                    <div class="row mb-3">
                        <div class="col-3">
                            <label class="form-label">Apellido</label>
                            <asp:TextBox ID="txtApellido" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="col-3">
                            <label class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombre" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="col-3">
                            <label class="form-label">DNI</label>
                            <asp:TextBox ID="txtDNI" class="form-control" runat="server" TextMode="Number" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="col-3">
                            <label class="form-label">E-Mail</label>
                            <asp:TextBox ID="txtMail" class="form-control" runat="server" TextMode="Email" Enabled="false"></asp:TextBox>
                        </div>
                    </div>
                    <label class="SubTituloABM">Turno</label>
                    <div class="row mb-3">
                        <div class="col-3">
                            <label class="form-label">Fecha</label>
                            <asp:TextBox ID="txtFecha" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="col-3">
                            <label class="form-label">Hora</label>
                            <asp:TextBox ID="txtHora" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="col-3">
                            <label class="form-label">Médico</label>
                            <asp:TextBox ID="txtMedico" class="form-control"  runat="server" Enabled="false"></asp:TextBox>
                        </div>
                        <div class="col-3">
                            <label class="form-label">Especialidad</label>
                            <asp:TextBox ID="txtEspecialidades" class="form-control" runat="server"  Enabled="false"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label class="form-label" style="font-weight: bold">Indique la causa por la cual solicita el turno: </label>
                        <asp:TextBox ID="txtObservacion" ClientIDMode="Static" class="form-control" Height="100px" Wrap="true" TextMode="MultiLine" runat="server" placeholder="Observación..."></asp:TextBox>
                        <div class="invalid-feedback d-none" id="validation-message">
                            Campo requerido.
                        </div>
                    </div>
                </div>
                <% }
                }   %>
                <div class="container">
                    <asp:Button ID="btnVolver" Visible="true" href="Turnos.aspx" runat="server" Text="⬅️  Volver a Turno" class="btn btn-secondary btn-lg" OnClick="btnVolver_Click" />
                    <asp:Button ID="btnVolverTurnos" Visible="false" runat="server" Text="Cancelar" class="btn btn-danger" OnClick="btnVolverTurnos_Click" />
                    <asp:Button ID="btnAceptar" Visible="false" runat="server" Text="Aceptar" class="btn btn-primary" OnClientClick="return validar()" OnClick="btnAceptar_Click" />
                    <%--<asp:Button ID="btn" Visible="false" runat="server" Text="Aceptar" class="btn btn-primary" OnClientClick="return validar()" OnClick="btnAceptar_Click" />--%>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
