<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMEspecialidades.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMEspecialidades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function validar() {
            // acá estamos usando JS puro, pero concatenando con una sentencia de C# embebido para obtener el Id del control, al que no le agregamos la propiedad ClientIDMode antes mencionada.
            var nombre = document.getElementById("txtNombre").value;
            var valido = true;
            // luego evalulamos
            console.log("el nombre es: " + nombre);
            if (nombre === "") {
                $("#txtNombre").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtNombre").removeClass("is-valid").addClass("is-valid");
                $("#validation-message").addClass("d-none").removeClass("d-block");
            }
            return valido;
        }
    </script>
    <div class="container">
        <label class="TituloABM">ABM Especialidad</label>
        <div class="row">
            <div class="col-2">
                <label class="form-label">Id</label>
                <asp:TextBox ID="txtId" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-10">
                <label class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" class="form-control" runat="server" ClientIDMode="Static" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message">
                    Campo requerido.
                </div>
            </div>
        </div>
        <div class="container">
            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClientClick="return validar()" OnClick="btnAceptar_Click" />
            <asp:Button ID="btnActivacion" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnActivacion_Click" />
        </div>
    </div>
    <div class="container" id="botoncitos">
        <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" CssClass="btn btn-secondary btn-lg" OnClick="btnVolver_Click" />
    </div>
</asp:Content>
