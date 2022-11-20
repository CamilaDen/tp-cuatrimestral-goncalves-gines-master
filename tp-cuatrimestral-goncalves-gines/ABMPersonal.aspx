<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMPersonal.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMPersonal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <label class="TituloABM">ABM PERSONAL</label>
        <div class="row g-3">
            <div class="col-2">
                <label class="form-label">Id</label>
                <asp:TextBox ID="txtId" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-5">
                <label class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellidoPersonal" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-5">
                <label class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombrePersonal" class="form-control" runat="server" placeholder=""></asp:TextBox>
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
            <div class="col-6">
                <label class="form-label">Contraseña</label>
                <asp:TextBox ID="txtPass" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-6">
                <label class="form-label">Perfil</label>
                <asp:DropDownList ID="ddlPerfiles" CssClass="form-select" runat="server">
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
