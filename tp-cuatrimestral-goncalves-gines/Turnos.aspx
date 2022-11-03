<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Turnos.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Turnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="botoncitos">
             <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color:black; border-style:none" OnClick="btnVolver_Click"/>
             <asp:Button ID="btnCrear" runat="server" Text="Crear" class="btn btn-primary btn-lg" Style="background-color: #5dbf4a; color:black; border-style:none"/>
         </div>
</asp:Content>
