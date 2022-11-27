<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearTurno.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.CrearTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
         <label class="TituloABM">Nuevo Turno</label>
        <div class="row g-3" style="justify-content:center">
             <div class="col-md-2">
                <label class="form-label">Numero</label>
                <asp:TextBox ID="txtNumero" class="form-control" ClientIDMode="Static"  runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label class="form-label">Fecha de Solicitud</label>
                <asp:TextBox ID="txtFechaSoli" TextMode="Date" class="form-control" ClientIDMode="Static"  runat="server" placeholder=""></asp:TextBox>
            </div>
             <div class="col-md-2">
                <label class="form-label">Fecha</label>
                <asp:TextBox ID="txtFecha" TextMode="Date" class="form-control" ClientIDMode="Static"  runat="server" placeholder=""></asp:TextBox>
            </div>
             <div class="col-md-2">
                <label class="form-label">Hora</label>
                <asp:TextBox ID="txtHorario" TextMode="Time" format="hh" class="form-control" ClientIDMode="Static"  runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label class="form-label">Medico</label>
                <asp:DropDownList ID="txtMedico" class="form-control"  runat="server" placeholder=""></asp:DropDownList>
            </div>
            <div id="botoncitos">
                <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color: black; border-style: none" OnClick="btnVolver_Click" />
            </div>
        </div>
    </div>
</asp:Content>
