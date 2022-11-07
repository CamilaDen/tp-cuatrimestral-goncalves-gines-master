<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMPersonal.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMPersonal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <label class="TituloABM">ABM PERSONAL</label>
        <form class="row g-3">
      <div class="col-md-6">
            <label class="form-label">Apellido</label>
            <asp:TextBox ID="txtApellidoPersonal" class="form-control" runat="server" placeholder=""></asp:TextBox>
      </div>
        <div class="col-md-6">
            <label class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombrePersonal" class="form-control" runat="server" placeholder=""></asp:TextBox>
      </div>              
        <div class="col-md-6">
             <label class="form-label">DNI</label>
             <asp:TextBox ID="txtDNI" class="form-control" runat="server" placeholder="123456789"></asp:TextBox>
      </div>
        <div class="col-md-6">
             <label class="form-label">E-Mail</label>
             <asp:TextBox ID="txtMail" class="form-control" runat="server" placeholder="example@algo.com"></asp:TextBox>
      </div>
            <div class="col-md-6">
             <label class="form-label">Fecha Nacimiento</label>
             <asp:TextBox ID="txtFNacimiento" class="form-control" runat="server" placeholder="01/01/1999"></asp:TextBox>
      </div>
        <div class="col-md-6">
             <label class="form-label">Contraseña</label>
             <asp:TextBox ID="txtContraseña" class="form-control" runat="server"></asp:TextBox>
      </div>
      <div class="col-12">
        <button type="submit" class="btn btn-primary">Aceptar</button>
      </div>
    </form>
        <hr/>
        <div id="botoncitos">
                <asp:Button ID="btnVolver" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color:black; border-style:none" OnClick="btnVolver_Click"/>
        </div>
    </div>
</asp:Content>
