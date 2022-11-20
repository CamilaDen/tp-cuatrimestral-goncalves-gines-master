<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMHorarios.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMHorarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function validar() {
            // acá estamos usando JS puro, pero concatenando con una sentencia de C# embebido para obtener el Id del control, al que no le agregamos la propiedad ClientIDMode antes mencionada.
            var nombre = document.getElementById("<% = txtNombre.ClientID %>").value;
            // luego evalulamos
            if (descripcion === "" || nombre === "") {
                alert("Debes completar los campos");
                return false;
            }
            return true;
        }
    </script>
    <div class="container">
        <label class="TituloABM">Horarios</label>
        <div class="row g-3">
            <div class="col-md-2">
                <label class="form-label">Id</label>
                <asp:TextBox ID="txtId" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label class="form-label">Horario Desde</label>
                <asp:TextBox ID="txtHorarioDesde" class="form-control" runat="server" placeholder="" TextMode="Number"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label class="form-label" aria-required="true">Horario Hasta</label>
                <asp:TextBox ID="txtHorarioHasta" class="form-control" runat="server" placeholder="" TextMode="Number"></asp:TextBox>
            </div>
             <div class="col-md-6">
                <label class="form-label">Dia</label>
                <asp:DropDownList CssClass="form-select" ID="ddlDia" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-12">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" class="btn btn-primary" Style="background-color: #63bbdc; color: black; border-style: none" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnActivacion" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnActivacion_Click" />
            </div>
        </div>
        <hr />
        <div id="botoncitos">
            <asp:Button ID="btnVolver" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color: black; border-style: none" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
