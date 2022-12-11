<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearTurnoManual.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.CrearTurnoManual" %>

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
                <asp:Label ID="lblTituloABMTurno" runat="server" CssClass="TituloABM" Text="Nuevo Turno"></asp:Label>
                <div class="row g-3" style="justify-content: left; margin-top: 10px;">
                    <div class="row">
                        <asp:Label ID="lblSubTituloMedico" runat="server" Text="Seleccione un médico de la especialidad " CssClass="form-label" Style="font-weight: bold"></asp:Label>
                        <asp:TextBox ID="txtMedico" class="form-control" Style="width: 500px; margin-left: 15px" placeholder="Nombre, Apellido o DNI del Médico" runat="server"></asp:TextBox>
                        <div class="col-md-2">
                            <asp:Button ID="btnBuscarRapidoMedico" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscarRapidoMedico_Click" />
                        </div>
                    </div>
                    <asp:GridView ID="dgvSeleccionarMedico" runat="server" CssClass="table align-middle table-sm" AutoGenerateColumns="false" DataKeyNames="Id" EmptyDataText="No hay resultados!" OnSelectedIndexChanged="dgvSeleccionarMedico_SelectedIndexChanged">
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
                        <SelectedRowStyle BackColor="YellowGreen" Font-Bold="true" />
                    </asp:GridView>
                </div>
                <div class="row justify-content-around ">
                    <div class="col-3">
                        <div class="container">
                            <asp:Label ID="lblDiaTurno" runat="server" Visible="false" Text="Seleccione una fecha" CssClass="form-label" Style="font-weight: bold"></asp:Label>
                            <asp:Calendar ID="cldDiaTurno" runat="server" Visible="false" OnSelectionChanged="cldDiaTurno_SelectionChanged" OnDayRender="cldDiaTurno_DayRender"></asp:Calendar>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="container">
                            <asp:Label ID="lblHorariosDisponibles" Visible="false" runat="server" CssClass="form-label" Style="font-weight: bold">Horarios Disponibles</asp:Label>
                            <asp:DropDownList ID="ddlHorariosDisponibles" Visible="false" CssClass="form-select" ClientIDMode="Static" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="container">
                            <asp:Label ID="lblSinHorarios" runat="server" Visible="false" Text="Sin turnos disponibles" CssClass="form-label" Style="font-weight: bold; color: red;"></asp:Label>
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="container">
                            <asp:Label ID="lblObservacion" Visible="false" runat="server" CssClass="form-label" Style="font-weight: bold">Indique la causa por la cual solicita el turno:</asp:Label>
                            <asp:TextBox ID="txtObservacion" Visible="false" ClientIDMode="Static" class="form-control" Height="100px" Wrap="true" TextMode="MultiLine" runat="server" placeholder="Observación..."></asp:TextBox>
                            <div class="invalid-feedback d-none" id="validation-message">
                                Campo requerido.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <asp:Button ID="btnVolver" Visible="true" href="Turnos.aspx" runat="server" Text="⬅️  Volver a Turno" class="btn btn-secondary btn-lg" OnClick="btnVolver_Click" />
                    <asp:Button ID="btnVolverTurnos" Visible="false" runat="server" Text="Cancelar" class="btn btn-danger" OnClick="btnVolverTurnos_Click" />
                    <asp:Button ID="btnAceptar" Visible="false" runat="server" Text="Aceptar" class="btn btn-primary" OnClientClick="return validar()" OnClick="btnAceptar_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
