<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Medicos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <asp:GridView ID="dgvMedicos" runat="server" CssClass="table" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="Id" />
                <asp:BoundField HeaderText="Apellido" DataField="Persona.Apellido" />
                <asp:BoundField HeaderText="Nombre" DataField="Persona.Nombre" />
                <asp:BoundField HeaderText="Matricula" DataField="Matricula" />
                <asp:BoundField HeaderText="DNI" DataField="Persona.Dni" />
                <asp:BoundField HeaderText="Mail" DataField="Persona.Mail" />
                <asp:BoundField HeaderText="Fec. Nac." DataFormatString="{0:d}" DataField="Persona.FechaDeNacimiento" />
                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <asp:Button Text="Eliminar" CssClass="btn btn-danger" runat="server" ID="btnEliminar" CommandArgument='<%#Eval("Id") %>' CommandName="MedicoId" OnClick="btnEliminar_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
