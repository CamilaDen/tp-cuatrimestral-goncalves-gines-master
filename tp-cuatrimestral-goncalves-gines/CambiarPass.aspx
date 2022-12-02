<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CambiarPass.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.CambiarPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="container">
            <h2>Cambio de Pass</h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:TextBox ID="txtPasswordOld" TextMode="password" class="form-control" runat="server" placeholder="Password"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:TextBox ID="txtPasswordNew1" TextMode="password" class="form-control" runat="server" placeholder="Nueva Password"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:TextBox ID="txtPasswordNew2" TextMode="password" class="form-control" runat="server" placeholder="Confirmar la nueva Password"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Button type="submit" CssClass="btn btn-secondary" runat="server" Text="← Volver" OnClick="btnCancelar_Click" />
                        <asp:Button type="submit" CssClass="btn btn-success" runat="server" Text="Confirmar" OnClick="btnAceptar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
