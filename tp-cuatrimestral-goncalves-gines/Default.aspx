<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Hero">
        <div class="d-grid gap-2 col-6 mx-auto" style="padding: 50px; align-items: center">
            <a id="btnaTurnos" href="Turnos.aspx" runat="server" class="btn btn-primary" type="button" style="display: flex; align-items: center; justify-content: center; height: 50px; background-color: #63bbdcb8; color: black; border-radius: 20px; font-weight: bold; border-style: hidden">Turnos </a>
            <a id="btnaPacientes" href="Pacientes.aspx" runat="server" class="btn btn-primary" type="button" style="display: flex; align-items: center; justify-content: center; height: 50px; background-color: #63bbdcb8; color: black; border-radius: 20px; font-weight: bold; border-style: hidden">Pacientes </a>
            <a id="btnaEspecialidades" href="Especialidades.aspx" runat="server" class="btn btn-primary" type="button" style="display: flex; align-items: center; justify-content: center; height: 50px; background-color: #63bbdcb8; color: black; border-radius: 20px; font-weight: bold; border-style: hidden">Especialidades </a>
            <a id="btnaCoberturas" href="Coberturas.aspx" runat="server" class="btn btn-primary" type="button" style="display: flex; align-items: center; justify-content: center; height: 50px; background-color: #63bbdcb8; color: black; border-radius: 20px; font-weight: bold; border-style: hidden">Coberturas</a>
            <a id="btnaPersonalClinica" class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" style="display: flex; align-items: center; justify-content: center; height: 50px; background-color: #63bbdcb8; color: black; border-radius: 20px; font-weight: bold; border-style: hidden">Personal Clinica</a>
            <div class="collapse" id="collapseExample">
                <div class="d-grid gap-2 col-6 mx-auto" style="padding: 10px; align-items: center">
                    <a id="btnaMedicos" href="Medicos.aspx" runat="server" class="btn btn-primary" type="button" style="display: flex; align-items: center; justify-content: center; height: 50px; background-color: #20abddb8; color: black; border-radius: 20px; font-weight: bold; border-style: hidden">Médicos </a>
                    <a id="btnaPersonal" href="Personal.aspx" runat="server" class="btn btn-primary" type="button" style="display: flex; align-items: center; justify-content: center; height: 50px; background-color: #20abddb8; color: black; border-radius: 20px; font-weight: bold; border-style: hidden">Personal </a>
                    <a id="btnaPerfiles" href="Perfiles.aspx" runat="server" class="btn btn-primary" type="button" style="display: flex; align-items: center; justify-content: center; height: 50px; background-color: #20abddb8; color: black; border-radius: 20px; font-weight: bold; border-style: hidden">Perfiles </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
