using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class UsuarioNegocio
    {
        public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {  
                datos.setearProcedimiento("SP_Loguear");
                datos.setearParametro("@MAIL", usuario.Mail);
                datos.setearParametro("@PASS", usuario.Password);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["ID"];
                    usuario.Nombre = (string)datos.Lector["NOMBRE"];
                    usuario.Apellido = (string)datos.Lector["APELLIDO"];
                    usuario.Dni = (int)datos.Lector["DNI"];
                    usuario.Perfil = new Perfil();
                    usuario.Perfil.Id = (int)datos.Lector["IDPERFIL"];                   
                    /*1 es admin, 2 medico,3 recepcionista*/
                    return true; 
                }
                return false;
            }
            catch (Exception ex)
            {
                 throw ex;
            }
            finally { datos.cerrarConexion(); }
        }

        public void cambiarPass(int Id, string nuevaPass)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_CambiarPass");
                datos.setearParametro("@ID", Id);
                datos.setearParametro("@NUEVAPASS", nuevaPass);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public Usuario buscarPorMail(string mail)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_BuscarUsuarioXMail");
                datos.setearParametro("@MAIL", mail);
                datos.ejecutarLectura();
                Usuario usuario = new Usuario();

                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["ID"];
                    usuario.Nombre = (string)datos.Lector["NOMBRE"];
                    usuario.Apellido = (string)datos.Lector["APELLIDO"];
                    usuario.Dni = (int)datos.Lector["DNI"];
                    usuario.Mail = (string)datos.Lector["MAIL"];
                    usuario.Perfil = new Perfil();
                    usuario.Perfil.Id = (int)datos.Lector["IDPERFIL"];
                }
                return usuario;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { datos.cerrarConexion(); }
        }
        
    }
}
