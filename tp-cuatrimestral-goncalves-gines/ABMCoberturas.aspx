<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMCoberturas.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMCoberturas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <label class="TituloABM">Coberturas</label>
        <div class="row g-3">
            <div class="col-md-2">
                <label class="form-label">Id</label>
                <asp:TextBox ID="txtId" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-8">
                <label class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label class="form-label">Sigla</label>
                <asp:TextBox ID="txtSigla" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-2">
                <label class="form-label">CUIT</label>
                <asp:TextBox ID="txtCUIT" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Telefono</label>
                <asp:TextBox ID="txtTelefono" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label class="form-label">Direccion</label>
                <asp:TextBox ID="txtDireccion" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Mail</label>
                <asp:TextBox ID="txtMail" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-12">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" class="btn btn-primary" Style="background-color: #63bbdc; color: black; border-style: none" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnActivacion" runat="server" Text="Eliminar" Cssclass="btn btn-danger" OnClick="btnActivacion_Click" />
             </div>
        </div>
        <hr />
        <div id="botoncitos">
            <asp:Button ID="btnVolver" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color: black; border-style: none" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
