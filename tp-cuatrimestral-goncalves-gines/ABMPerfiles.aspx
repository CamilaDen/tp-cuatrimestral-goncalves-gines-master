<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMPerfiles.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function validar() {
            // acá estamos usando JS puro, pero concatenando con una sentencia de C# embebido para obtener el Id del control, al que le agregamos la propiedad ClientIDMode.
            var txtNombre = document.getElementById("txtNombre").value;
            var valido = true;
            // luego evalulamos
            if (txtNombre === "") {
                $("#txtNombre").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtNombre").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message").addClass("d-none").removeClass("d-block");
            }
            return valido;
        }
    </script>
    <div class="container">
        <label class="TituloABM">Especialidades</label>
        <div class="row g-3">
            <div class="col-md-2">
                <label class="form-label">Id</label>
                <asp:TextBox ID="txtId" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-10">
                <label class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message">
                    Campo requerido.
                </div>
            </div>
            <div class="col-12">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClientClick="return validar()" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnActivacion" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnActivacion_Click" />
            </div>
        </div>
        <div id="botoncitos">
            <asp:Button ID="btnVolver" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color: black; border-style: none" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
