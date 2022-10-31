<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Hero">

        <div class="d-grid gap-2 col-6 mx-auto" style="padding:50px; align-items:center">
            <a ID="btnaPersonalClinica" href="Personal.aspx" runat="server" class="btn btn-primary" type="button" Style="display:flex; align-items:center; justify-content:center; height:50px; background-color: #63bbdcb8; color:black; border-radius:20px; font-weight:bold; border-style:hidden">Personal Clinica </a>
            <a ID="btnaTurnos" href="Personal.aspx" runat="server" class="btn btn-primary" type="button" Style="display:flex; align-items:center; justify-content:center; height:50px; background-color: #63bbdcb8; color:black; border-radius:20px; font-weight:bold; border-style:hidden">Turnos </a>
            <a ID="btnaPacientes" href="Personal.aspx" runat="server"  class="btn btn-primary" type="button" Style="display:flex; align-items:center; justify-content:center; height:50px; background-color: #63bbdcb8; color:black; border-radius:20px; font-weight:bold; border-style:hidden">Pacientes </a>
            <a ID="btnaEspecialidades" href="Personal.aspx" runat="server" class="btn btn-primary" type="button" Style="display:flex; align-items:center; justify-content:center; height:50px; background-color: #63bbdcb8; color:black; border-radius:20px; font-weight:bold;  border-style:hidden">Especialidades </a>
            <a ID="btnaCoberturas" href="Personal.aspx" runat="server" class="btn btn-primary" type="button" Style="display:flex; align-items:center; justify-content:center; height:50px; background-color: #63bbdcb8; color:black; border-radius:20px; font-weight:bold; border-style:hidden">Coberturas</a>
        </div>
    </div>
</asp:Content>
