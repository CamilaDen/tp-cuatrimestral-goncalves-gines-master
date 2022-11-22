<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="tp_cuatrimestral_goncalves_gines.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LogIn</title>
        <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
    <link rel="stylesheet" href="Login.css" />
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   <%-- <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.6.2.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.8.1/jquery.validate.js"></script>
    <script src="~/Scripts/jquery.validate.unobtrusive.js"></script>--%>
   
 <%--   <script> validar() {
                // acá estamos usando JS puro, pero concatenando con una sentencia de C# embebido para obtener el Id del control, al que no le agregamos la propiedad ClientIDMode antes mencionada.
                var user = document.getElementById("txtLogin").value;
                var pass = document.getElementById("txtPassword").value;
                var valido = true;
                // luego evalulamos
                if (user === "") {
                    $("#txtLogin").removeClass("is-valid").addClass("is-invalid");
                    $("#validation-message").removeClass("d-none").addClass("d-block");
                    valido = false;
                }else {
                    $("#txtLogin").removeClass("is-valid").addClass("is-valid");
                    $("#validation-message").addClass("d-none").removeClass("d-block");
                }
                if (pass === "") {
                    $("#txtPassword").removeClass("is-valid").addClass("is-invalid");
                    $("#validation-message1").removeClass("d-none").addClass("d-block");
                    valido = false;
                }
                else {
                    $("#txtLogin").removeClass("is-valid").addClass("is-valid");
                    $("#validation-message1").addClass("d-none").removeClass("d-block");
                }
                return valido;
             }
    </script>--%>
</head>
<body >
    <div class="container">
        <div id="formContent">
  
        <div class="fadeIn first">
          <h3>Log In</h3>
          <img src="img/user.png" id="icon" alt="User Icon" />
        </div>
        <form runat="server">           
            <asp:TextBox ID="txtLogin" class="fadeIn second"  runat="server" placeholder="Usuario" required="true"></asp:TextBox>
            <asp:TextBox ID="txtPassword" TextMode="password" class="fadeIn third" runat="server"  placeholder="contraseña" required="true"></asp:TextBox>
            <asp:Button type="submit" class="fadeIn fourth" runat="server" text="Entrar"  OnClick="btnAceptar_Click" />
        </form>
        <div id="formFooter"> 
          <a class="underlineHover" href="#">Olvide mi contraseña</a>
        </div>
             
      </div>
    </div>
</body>
</html>