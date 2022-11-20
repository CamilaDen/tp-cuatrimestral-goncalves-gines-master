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

</head>
<body >
    <div class="container">
        <div id="formContent">
  
        <div class="fadeIn first">
          <h3>Log In</h3>
          <img src="img/user.png" id="icon" alt="User Icon" />
        </div>
        <form runat="server">           
            <asp:TextBox ID="txtLogin" class="fadeIn second" runat="server" placeholder="Usuario"></asp:TextBox>
            <asp:TextBox ID="txtPassword" class="fadeIn third" runat="server" placeholder="contraseña"></asp:TextBox>
            <asp:Button type="submit" class="fadeIn fourth" runat="server" text="Entrar" OnClick="btnAceptar_Click" />
        </form>
        <div id="formFooter">
          <a class="underlineHover" href="#">Olvide mi contraseña</a>
        </div>
             
      </div>
    </div>
</body>
</html>