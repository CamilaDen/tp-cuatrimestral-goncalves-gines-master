<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMPacientes.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMPacientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <label class="TituloABM">Pacientes</label>
        <div class="row g-3">
             <div class="col-2">
                <label class="form-label">Id</label>
                <asp:TextBox ID="txtId" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-5">
                <label class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellido" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-5">
                <label class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-4">
                <label class="form-label">DNI</label> 
                <asp:TextBox ID="txtDNI" class="form-control" runat="server" placeholder="123456789" TextMode="Number"></asp:TextBox>
            </div>
            <div class="col-4">
                <label class="form-label">E-Mail</label>
                <asp:TextBox ID="txtMail" class="form-control" runat="server" placeholder="example@algo.com" TextMode="Email"></asp:TextBox>
            </div>
            <div class="col-4">
                <label class="form-label">Fecha Nacimiento</label>
                <asp:TextBox ID="txtFNacimiento" class="form-control" runat="server" placeholder="01/01/1999" TextMode="Date"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label class="form-label">Peso</label>
                <asp:TextBox ID="txtPeso" class="form-control" runat="server" placeholder="Ejemplo: 65kg" TextMode="Number"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label class="form-label">Altura</label>
                <asp:TextBox ID="txtAltura" class="form-control" runat="server" placeholder="1.59" TextMode="Number" step="0.01" Width="140px" min="0"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label class="form-label">Obra Social</label>
                <asp:DropDownList ID="ddlObraSocialCoberturas" CssClass="form-select" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-md-4">
                <label class="form-label">Credencial</label>
                <asp:TextBox ID="txtCredencialPaciente" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-12">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" class="btn btn-primary" Style="background-color: #63bbdc; color: black; border-style: none" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnActivacion" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnActivacion_Click" />
            </div>
        </div>
        <hr />
        <div id="botoncitos">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color: black; border-style: none" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
