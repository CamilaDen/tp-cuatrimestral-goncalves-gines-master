using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public static class Seguridad
    {
        
        public static bool sesionActiva(object user)
        {
            Usuario usuario = user != null ? (Usuario)user : null;
            return (usuario != null && usuario.Id != 0);
        }
        
        public static bool esAdmin(object user)
        {
            Usuario usuario = user != null ? (Usuario)user : null;
            return (usuario != null && (usuario.Perfil.Id == (int)dominio.TipoPerfil.ADMINISTRADOR));
        }

        public static bool esRecepcionista(object user)
        {
            Usuario usuario = user != null ? (Usuario)user : null;
            return (usuario != null && (usuario.Perfil.Id == (int)dominio.TipoPerfil.RECEPCIONISTA));
        }

        public static bool esMedico(object user)
        {
            Usuario usuario = user != null ? (Usuario)user : null;
            return (usuario != null && (usuario.Perfil.Id == (int)dominio.TipoPerfil.MEDICO));
        }

        public static string reiniciarPass()
        {
            Random rdn = new Random();
            string caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890%$#@";
            int longitud = caracteres.Length;
            char letra;
            int longitudContrasenia = 10;
            string contraseniaAleatoria = string.Empty;
            for (int i = 0; i < longitudContrasenia; i++)
            {
                letra = caracteres[rdn.Next(longitud)];
                contraseniaAleatoria += letra.ToString();
            }
            return contraseniaAleatoria;
        }
    }
}
