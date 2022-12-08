<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMPersonal.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMPersonal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function validar() {
            // acá estamos usando JS puro, pero concatenando con una sentencia de C# embebido para obtener el Id del control, al que le agregamos la propiedad ClientIDMode.
            var apellido = document.getElementById("txtApellidoPersonal").value;
            var nombre = document.getElementById("txtNombrePersonal").value;
            var dni = document.getElementById("txtDNI").value;
            var mail = document.getElementById("txtMail").value;
            var fecNacimiento = document.getElementById("txtFNacimiento").value;
            var pass = document.getElementById("txtPass").value;
            var valido = true;
            // luego evalulamos
            if (apellido === "") {
                $("#txtApellidoPersonal").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message1").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtApellidoPersonal").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message1").addClass("d-none").removeClass("d-block");
            }
            if (nombre === "") {
                $("#txtNombrePersonal").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message2").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtNombrePersonal").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message2").addClass("d-none").removeClass("d-block");
            }
            if (dni === "") {
                $("#txtDNI").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message3").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtDNI").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message3").addClass("d-none").removeClass("d-block");
            }
            if (mail === "") {
                $("#txtMail").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message4").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtMail").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message4").addClass("d-none").removeClass("d-block");
            }
            if (fecNacimiento === "") {
                $("#txtFNacimiento").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message5").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtFNacimiento").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message5").addClass("d-none").removeClass("d-block");
            }
            if (pass === "") {
                $("#txtPass").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message6").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtPass").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message6").addClass("d-none").removeClass("d-block");
            }
            return valido;
        }
    </script>
    <div class="container">
        <label class="TituloABM">ABM Personal</label>
        <div class="row g-3">
            <div class="col-2">
                <label class="form-label">Id</label>
                <asp:TextBox ID="txtId" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-5">
                <label class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellidoPersonal" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message1">
                    Campo requerido.
                </div>
            </div>
            <div class="col-5">
                <label class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombrePersonal" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message2">
                    Campo requerido.
                </div>
            </div>
            <div class="col-4">
                <label class="form-label">DNI</label>
                <asp:TextBox ID="txtDNI" class="form-control" ClientIDMode="Static" runat="server" placeholder="123456789" TextMode="Number"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message3">
                    Campo requerido.
                </div>
            </div>
            <div class="col-4">
                <label class="form-label">E-Mail</label>
                <asp:TextBox ID="txtMail" class="form-control" ClientIDMode="Static" runat="server" placeholder="example@algo.com" TextMode="Email"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message4">
                    Campo requerido.
                </div>
            </div>
            <div class="col-4">
                <label class="form-label">Fecha Nacimiento</label>
                <asp:TextBox ID="txtFNacimiento" class="form-control" ClientIDMode="Static" runat="server" placeholder="01/01/1999" TextMode="Date"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message5">
                    Campo requerido.
                </div>
            </div>
            <div class="col-6">
                <label class="form-label">Contraseña</label>
                <asp:TextBox ID="txtPass" class="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message6">
                    Campo requerido.
                </div>
            </div>
            <div class="col-6">
                <label class="form-label">Perfil</label>
                <asp:DropDownList ID="ddlPerfiles" CssClass="form-select" ClientIDMode="Static" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-12">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClientClick="return validar()" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnActivacion" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnActivacion_Click" />
            </div>
        </div>
        <hr />
        <div class="container" id="botoncitos">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="⬅️  Volver" CssClass="btn btn-secondary btn-lg" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
