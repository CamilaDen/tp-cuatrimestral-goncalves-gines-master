<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMCoberturas.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMCoberturas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function validar() {
            // acá estamos usando JS puro, pero concatenando con una sentencia de C# embebido para obtener el Id del control, al que le agregamos la propiedad ClientIDMode.
            var txtNombre = document.getElementById("txtNombre").value;
            var txtSigla = document.getElementById("txtSigla").value;
            var txtCUIT = document.getElementById("txtCUIT").value;
            var txtTelefono = document.getElementById("txtTelefono").value;
            var txtDireccion = document.getElementById("txtDireccion").value;
            var txtMail = document.getElementById("txtMail").value;
            var valido = true;
            // luego evalulamos
            if (txtNombre === "") {
                $("#txtNombre").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message1").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtNombre").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message1").addClass("d-none").removeClass("d-block");
            }
            if (txtSigla === "") {
                $("#txtSigla").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message2").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtSigla").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message2").addClass("d-none").removeClass("d-block");
            }
            if (txtCUIT === "") {
                $("#txtCUIT").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message3").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtCUIT").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message3").addClass("d-none").removeClass("d-block");
            }
            if (txtTelefono === "") {
                $("#txtTelefono").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message4").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtTelefono").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message4").addClass("d-none").removeClass("d-block");
            }
            if (txtDireccion === "") {
                $("#txtDireccion").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message5").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtDireccion").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message5").addClass("d-none").removeClass("d-block");
            }
            if (txtMail === "") {
                $("#txtMail").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message6").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtMail").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message6").addClass("d-none").removeClass("d-block");
            }
            return valido;
        }
    </script>
    <div class="container">
        <label class="TituloABM">ABM Cobertura</label>
        <div class="row g-3">
            <div class="col-md-2">
                <label class="form-label">Id</label>
                <asp:TextBox ID="txtId" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-8">
                <label class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message1">
                    Campo requerido.
                </div>
            </div>
            <div class="col-md-2">
                <label class="form-label">Sigla</label>
                <asp:TextBox ID="txtSigla" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message2">
                    Campo requerido.
                </div>
            </div>
            <div class="col-md-2">
                <label class="form-label">CUIT</label>
                <asp:TextBox ID="txtCUIT" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message3">
                    Campo requerido.
                </div>
            </div>
            <div class="col-md-4">
                <label class="form-label">Teléfono</label>
                <asp:TextBox ID="txtTelefono" class="form-control" ClientIDMode="Static" runat="server" placeholder="" TextMode="Phone"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message4">
                    Campo requerido.
                </div>
            </div>
            <div class="col-md-6">
                <label class="form-label">Dirección</label>
                <asp:TextBox ID="txtDireccion" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message5">
                    Campo requerido.
                </div>
            </div>
            <div class="col-md-4">
                <label class="form-label">Mail</label>
                <asp:TextBox ID="txtMail" class="form-control" ClientIDMode="Static" runat="server" placeholder="" TextMode="Email"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message6">
                    Campo requerido.
                </div>
            </div>
            <div class="col-12">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClientClick="return validar()" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnActivacion" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnActivacion_Click" />
            </div>
        </div>
        <hr />
        <div class="container">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" CssClass="btn btn-secondary btn-lg" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
