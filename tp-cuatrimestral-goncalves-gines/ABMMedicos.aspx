<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ABMMedicos.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.ABMMedicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function validar() {
            // acá estamos usando JS puro, pero concatenando con una sentencia de C# embebido para obtener el Id del control, al que le agregamos la propiedad ClientIDMode.
            var txtApellido = document.getElementById("txtApellido").value;
            var txtNombre = document.getElementById("txtNombre").value;
            var txtDNI = document.getElementById("txtDNI").value;
            var txtMail = document.getElementById("txtMail").value;
            var txtFNacimiento = document.getElementById("txtFNacimiento").value;
            var txtMatricula = document.getElementById("txtMatricula").value;
            var txtPass = document.getElementById("txtPass").value;
            var valido = true;
            // luego evalulamos
            if (txtApellido === "") {
                $("#txtApellido").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message1").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtApellido").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message1").addClass("d-none").removeClass("d-block");
            }
            if (txtNombre === "") {
                $("#txtNombre").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message2").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtNombre").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message2").addClass("d-none").removeClass("d-block");
            }
            if (txtDNI === "") {
                $("#txtDNI").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message3").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtDNI").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message3").addClass("d-none").removeClass("d-block");
            }
            if (txtMail === "") {
                $("#txtMail").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message4").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtMail").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message4").addClass("d-none").removeClass("d-block");
            }
            if (txtFNacimiento === "") {
                $("#txtFNacimiento").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message5").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtFNacimiento").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message5").addClass("d-none").removeClass("d-block");
            }
            if (txtMatricula === "") {
                $("#txtMatricula").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message6").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtMatricula").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message6").addClass("d-none").removeClass("d-block");
            }
            if (txtPass === "") {
                $("#txtPass").removeClass("is-valid").addClass("is-invalid");
                $("#validation-message7").removeClass("d-none").addClass("d-block");
                valido = false;
            } else {
                $("#txtPass").removeClass("is-invalid").addClass("is-valid");
                $("#validation-message7").addClass("d-none").removeClass("d-block");
            }
            return valido;
        }
    </script>
    <div class="container">
        <label class="TituloABM">ABM Médico</label>
        <div class="row g-3">
            <div class="col-2">
                <label class="form-label">Id</label>
                <asp:TextBox ID="txtId" class="form-control" runat="server" placeholder=""></asp:TextBox>
            </div>
            <div class="col-5">
                <label class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellido" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message1">
                    Campo requerido.
                </div>
            </div>
            <div class="col-5">
                <label class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message2">
                    Campo requerido.
                </div>
            </div>
            <div class="col-6">
                <label class="form-label">DNI</label>
                <asp:TextBox ID="txtDNI" class="form-control" ClientIDMode="Static" runat="server" placeholder="123456789" TextMode="Number"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message3">
                    Campo requerido.
                </div>
            </div>
            <div class="col-6">
                <label class="form-label">E-Mail</label>
                <asp:TextBox ID="txtMail" class="form-control" ClientIDMode="Static" runat="server" placeholder="example@algo.com" TextMode="Email"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message4">
                    Campo requerido.
                </div>
            </div>
            <div class="col-5">
                <label class="form-label">Fecha Nacimiento</label>
                <asp:TextBox ID="txtFNacimiento" class="form-control" ClientIDMode="Static" runat="server" placeholder="01/01/1999" TextMode="Date"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message5">
                    Campo requerido.
                </div>
            </div>
            <div class="col-5">
                <label class="form-label">Matricula</label>
                <asp:TextBox ID="txtMatricula" class="form-control" ClientIDMode="Static" runat="server" placeholder=""></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message6">
                    Campo requerido.
                </div>
            </div>
            <div class="col-2">
                <label class="form-label">Contraseña</label>
                <asp:TextBox ID="txtPass" class="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                <div class="invalid-feedback d-none" id="validation-message7">
                    Campo requerido.
                </div>
            </div>
            <hr />
            <div class="col-4">
                <h3>Especialidades</h3>
                <asp:GridView ID="dgvEspecialidad" runat="server" CssClass="table table-hover table-sm" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="Selección">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbSelect" CssClass="gridCB" runat="server"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Id" DataField="Id" />
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-8">
                <h3>Horarios</h3>
                <asp:GridView ID="dgvHorario" runat="server" CssClass="table table-hover table-sm" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="Selección">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbSelect" CssClass="gridCB" runat="server"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Id" DataField="Id" />
                        <asp:BoundField HeaderText="Dia" DataField="Dia.Nombre" />
                        <asp:BoundField HeaderText="Desde" DataField="Hora_Desde" />
                        <asp:BoundField HeaderText="Hasta" DataField="Hora_Hasta" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-12">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClientClick="return validar()" OnClick="btnAceptar_Click" />
                <asp:Button ID="btnActivacion" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnActivacion_Click" />
            </div>
        </div>
        <hr />
        <div id="botoncitos">
            <asp:Button ID="btnVolver" href="Default.aspx" runat="server" Text="← Volver" class="btn btn-primary btn-lg" Style="background-color: #63bbdc; color: black; border-style: none" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>
