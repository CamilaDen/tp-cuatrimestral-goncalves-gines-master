<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearTurno.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.CrearTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <label class="TituloABM">Nuevo Turno</label>
            <div class="row g-3" style="justify-content:center">
                 <div class="col-md-2">
                    <label class="form-label">Numero</label>
                    <asp:TextBox ID="txtId" class="form-control" ClientIDMode="Static"  runat="server" placeholder=""></asp:TextBox>
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
                <div id="container">
                    <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-primary btn-lg" OnClick="btnVolver_Click" />
                </div>
            </div>
         </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>
