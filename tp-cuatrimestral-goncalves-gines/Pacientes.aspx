<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Pacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <label class="TituloABM">ABM PACIENTES</label>
        <form class="row g-3">
      <div class="col-md-6">
        <label  class="form-label">Apellido</label>
          <asp:TextBox ID="txtApellidoPaciente" class="form-control" runat="server"></asp:TextBox>
      </div>
      <div class="col-md-6">
        <label  class="form-label">Nombre</label>
          <asp:TextBox ID="txtNombrePaciente" class="form-control" runat="server"></asp:TextBox>
      </div>
      <div class="col-12">
        <label class="form-label">DNI</label>
         <asp:TextBox ID="txtDNIPaciente" class="form-control" runat="server" placeholder="123456789"></asp:TextBox>
      </div>
      <div class="col-12">
        <label class="form-label">E-Mail</label>
        <asp:TextBox ID="txtMailPaciente" class="form-control" runat="server" placeholder="ejemplo@ejemp.com"></asp:TextBox>
      </div>
      <div class="col-md-6">
        <label class="form-label">Grupo Sanguineo</label>
          <asp:TextBox ID="txtGSPaciente" class="form-control" runat="server" placeholder="Ejemplo: A+"></asp:TextBox>
      </div>
            <div class="col-md-6">
        <label class="form-label">Peso</label>
          <asp:TextBox ID="txtPesoPaciente" class="form-control" runat="server" placeholder="Ejemplo: 65kg"></asp:TextBox>
      </div>
     <div class="col-md-6">
        <label  class="form-label">Obra Social</label>
         <select id="ObraSocial" class="form-select">
          <option selected>OSDE</option>
          <option>Medicus</option>
          <option>Otra..</option>
        </select>
      </div>
      <div class="col-md-4">
        <label class="form-label">Credencial</label>
        <asp:TextBox ID="txtCredencialPaciente" class="form-control" runat="server" placeholder=""></asp:TextBox>
      </div>
      <div class="col-md-2">
        <label  class="form-label">Zip</label>
        <input type="text" class="form-control" id="inputZip">
      </div>
      <div class="col-12">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" id="gridCheck">
          <label class="form-check-label" for="gridCheck">
            Si
          </label>
        </div>
      </div>
      <div class="col-12">
        <button type="submit" class="btn btn-primary">Aceptar</button>
      </div>
    </form>
        <hr />
        <div id="botoncitos">
                <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color:black; border-style:none" OnClick="btnVolver_Click"/>
                <%--<asp:Button ID="btnCrear" runat="server" Text="Crear" class="btn btn-primary btn-lg" Style="background-color: #5dbf4a; color:black; border-style:none"/>--%>
        </div>
    </div>
</asp:Content>
