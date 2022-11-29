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
            {   /*hacer sp*/
                datos.setearConsulta("select ID, IDPERFIL from USUARIO WHERE NOMBREUSUARIO=@usuario AND PASS=@pass");
                datos.setearParametro("@usuario", usuario.Nombre);
                datos.setearParametro("pass", usuario.Password);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["ID"];
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
    }
}
