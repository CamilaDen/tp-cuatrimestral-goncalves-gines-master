<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMHorarios.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMHorarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function validar() {
            // acá estamos usando JS puro, pero concatenando con una sentencia de C# embebido para obtener el Id del control, al que le agregamos la propiedad ClientIDMode.
            var horarioDesde = document.getElementById("txtHorarioDesde").value;
            var horarioHasta = document.getElementById("txtHorarioHasta").value;
            var valido = true;
            // luego evalulamos
            if (horarioDesde === "") {
                $("#txtHorarioDesde").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtHorarioDesde").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message").addClass("d-none").removeClass("d-block");
            }
            if (horarioHasta === "") {
                $("#txtHorarioHasta").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message2").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtHorarioHasta").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message2").addClass("d-none").removeClass("d-block");
            }
            return valido;
        }
    </script>
    <div class="container">
        <label class="TituloABM">ABM Horario</label>
        <div class="row g-3">
            <div class="col-md-2">
                <label class="form-label">Id</label>
                <asp:TextBox ID="txtId" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label class="form-label">Dia</label>
                <asp:DropDownList CssClass="form-select" ID="ddlDia" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-md-2">
                <label class="form-label">Horario Desde</label>
                <asp:TextBox ID="txtHorarioDesde" CssClass="form-control" ClientIDMode="Static" runat="server" placeholder="" TextMode="Number"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message">
                    Campo requerido.
                </div>
            </div>
            <div class="col-md-2">
                <label class="form-label" aria-required="true">Horario Hasta</label>
                <asp:TextBox ID="txtHorarioHasta" CssClass="form-control" ClientIDMode="Static" runat="server" placeholder="" TextMode="Number"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message2">
                    Campo requerido.
                </div>
            </div>
            <div class="col-12">
                <asp:Button Text="Aceptar" ID="btnAceptar" OnClientClick="return validar()" OnClick="btnAceptar_Click" CssClass="btn btn-primary" runat="server" />
                <asp:Button ID="btnActivacion" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnActivacion_Click" />
            </div>
        </div>
        <hr />
        <div class="container" id="botoncitos">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="⬅️  Volver" CssClass="btn btn-secondary btn-lg" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
