<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMTurnos.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMTurnos" %>

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
    <div class="container">
        <label class="TituloABM">Turno</label>   
        <hr />
        <label class="SubTituloABM">Detalle</label>
        <div class="row mb-3">
            <div class="col-4">
                <label class="form-label">ID</label>
                <asp:TextBox ID="txtId" class="form-control" runat="server" Enabled="false"></asp:TextBox>
            </div>
            <div class="col-4">
                <label class="form-label">Fecha</label>
                <asp:TextBox ID="txtFecha" class="form-control" runat="server" Enabled="false"></asp:TextBox>
            </div>
            <div class="col-4">
                <label class="form-label">Hora</label>
                <asp:TextBox ID="txtHora" class="form-control" runat="server" Enabled="false"></asp:TextBox>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-4">
                <label class="form-label">Médico</label>
                <asp:TextBox ID="txtMedico" class="form-control" runat="server" Enabled="false"></asp:TextBox>
            </div>
            <div class="col-4">
                <label class="form-label">Especialidad</label>
                <asp:TextBox ID="txtEspecialidades" class="form-control" runat="server" Enabled="false"></asp:TextBox>
            </div>
            <div class="col-4">
                <label class="form-label">Estado</label>
                <asp:DropDownList ID="ddlEstado" CssClass="form-select" runat="server" Enabled="false">
                </asp:DropDownList>
            </div>
        </div>
        <hr />
        <div class="row mb-3">
            <label class="SubTituloABM">Paciente</label>
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
        <hr />
        <div class="row mb-3">
            <label class="form-label" style="font-weight: bold">Causa por la cual solicita el turno: </label>
            <asp:TextBox ID="txtObservacion" ClientIDMode="Static" class="form-control" Height="100px" Wrap="true" TextMode="MultiLine" runat="server" placeholder="Observación..." Enabled="false"></asp:TextBox>
            <div class="invalid-feedback d-none" id="validation-message">
                Campo requerido.
            </div>
        </div>
    </div>
    <div class="container">
        <asp:Button ID="btnVolver" href="Turnos.aspx" runat="server" Text="⬅ Volver a Turno" class="btn btn-secondary btn-lg" OnClick="btnVolver_Click" />
        <asp:Button ID="btnEditar" Visible="false" runat="server" Text="Editar" class="btn btn-primary btn-lg" OnClientClick="return validar()" OnClick="btnEditar_Click" />
        <asp:Button ID="btnCancelar" Visible="false" runat="server" Text="Cancelar" class="btn btn-danger btn-lg" OnClientClick="return validar()" OnClick="btnCancelar_Click" />
        <asp:Button ID="btnAceptar" Visible="false" runat="server" Text="Aceptar" class="btn btn-success btn-lg" OnClientClick="return validar()" OnClick="btnAceptar_Click" />
    </div>
</asp:Content>
