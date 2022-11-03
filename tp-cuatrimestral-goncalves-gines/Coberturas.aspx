<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Coberturas.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.Cobertura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <asp:GridView ID="dgvCoberturas" runat="server" CssClass="table" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="Id"/>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Sigla" DataField="Sigla" />
                <asp:BoundField HeaderText="CUIT" DataField="Cuit" />
                <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
                <asp:BoundField HeaderText="Direccion" DataField="Direccion" />
                <asp:BoundField HeaderText="Mail" DataField="Mail" />
                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <asp:Button Text="Eliminar" CssClass="btn btn-danger" runat="server" ID="btnEliminar" CommandArgument='<%#Eval("Id") %>' CommandName="EspecialidadId" OnClick="btnEliminar_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
         <div id="botoncitos">
             <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color:black; border-style:none" OnClick="btnVolver_Click"/>
             <asp:Button ID="btnCrear" runat="server" Text="Crear" class="btn btn-primary btn-lg" Style="background-color: #5dbf4a; color:black; border-style:none"/>
         </div>
    </div>
</asp:Content>
