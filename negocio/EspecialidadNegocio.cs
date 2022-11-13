using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace negocio
{
    public class EspecialidadNegocio
    {
        public List<Especialidad> listarConSP(string id = "")
        {
            List<Especialidad> lista = new List<Especialidad>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if (id == "")
                {
                    datos.setearProcedimiento("SP_ListarEspecialidades");
                }
                else
                {
                    datos.setearProcedimiento("SP_ListarEspecialidadesxId");
                    datos.setearParametro("@ID", int.Parse(id));
                }
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Especialidad aux = new Especialidad();
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

        public void agregar(Especialidad nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_AltaEspecialidad");
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

        public void modificar(Especialidad modificacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ModificarEspecialidad");
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
                    datos.setearProcedimiento("SP_ReactivarLogicoEspecialidad");
                else
                    datos.setearProcedimiento("SP_EliminarLogicoEspecialidad");
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
