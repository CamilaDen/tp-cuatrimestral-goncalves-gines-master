using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class PerfilNegocio
    {
        public List<Perfil> listarConSP(string id = "")
        {
            List<Perfil> lista = new List<Perfil>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if (id == "")
                {
                    datos.setearProcedimiento("SP_ListarPerfiles");
                }
                else
                {
                    datos.setearProcedimiento("SP_ListarPerfilesxId");
                    datos.setearParametro("@ID", int.Parse(id));
                }
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Perfil aux = new Perfil();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Activo = (bool)datos.Lector["Activo"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void agregar(Perfil nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_AltaPerfil");
                datos.setearParametro("@NOMBRE", nuevo.Nombre);
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

        public void modificar(Perfil modificacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ModificarPerfil");
                datos.setearParametro("@ID", modificacion.Id);
                datos.setearParametro("@NOMBRE", modificacion.Nombre);
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

        public void eliminarLogico(int id, bool activo = false)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if (activo)
                    datos.setearProcedimiento("SP_ReactivarLogicoPerfil");
                else
                    datos.setearProcedimiento("SP_EliminarLogicoPerfil");
                datos.setearParametro("@ID", id);
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
    }
}
