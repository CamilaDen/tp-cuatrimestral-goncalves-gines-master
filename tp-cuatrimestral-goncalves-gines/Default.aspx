<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="d-grid gap-2 col-6 mx-auto" style="padding:50px">
        <asp:Button ID="btnaPersonalClinica" runat="server" Text="Personal Clinica" class="btn btn-primary" type="button" Style="height:50px; background-color: #45c1ae; color:black; font-weight:bold; border-style:hidden" />
        <asp:Button ID="btnaTurnos" runat="server" Text="Turnos" class="btn btn-primary" type="button" Style="height:50px; background-color: #45c1ae; color:black; font-weight:bold; border-style:hidden"/>
        <asp:Button ID="btnaPacientes" runat="server" Text="Pacientes" class="btn btn-primary" type="button" Style="height:50px; background-color: #45c1ae; color:black; font-weight:bold; border-style:hidden"/>
        <asp:Button ID="btnaEspecialidades" runat="server" Text="Especialidades" class="btn btn-primary" type="button" Style="height:50px; background-color: #45c1ae; color:black; font-weight:bold; border-style:hidden"/>
        <asp:Button ID="btnaCoberturas" runat="server" Text="Coberturas" class="btn btn-primary" type="button" Style=" height:50px; background-color: #45c1ae; color:black; font-weight:bold; border-style:hidden" />
    </div>


</asp:Content>
