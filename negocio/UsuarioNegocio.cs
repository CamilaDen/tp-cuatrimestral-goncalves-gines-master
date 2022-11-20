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
                datos.setearConsulta("select U.id, U.PASS,P.id from PERFIL P inner join USUARIO U On P.ID = U.id where U.NOMBREUSUARIO=@usuario AND U.pass=@pass");
                datos.setearParametro("@usuario", usuario.Id);
                datos.setearParametro("pass", usuario.Password);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["U.ID"];
                    //usuario.Perfil.Id = (int)datos.Lector["P.id"] == TipoPerfil.ADMINISTRADOR ? 2 : 3;
                    /*1 es admin, 2 medico,4 recepcionista*/
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
