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
       /*public bool Loguear(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select U.ID, U.PASS,P.id from PERFIL P inner join USUARIO U On P.ID = U.id where U.id=@usuario AND U.pass=@pass");
                datos.setearParametro("@usuario", usuario.Id);
                datos.setearParametro("pass", usuario.Password);
                datos.ejecutarLectura();
                while (datos.Lector.Read()) {
                    usuario.Id = (int)datos.Lector["U.ID"];
                    usuario.Perfil.Id = (int)datos.Lector["P.id"];

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally { datos.cerrarConexion(); }
        }*/
    }
}
