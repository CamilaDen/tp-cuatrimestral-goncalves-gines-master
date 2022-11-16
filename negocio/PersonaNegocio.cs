using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class PersonaNegocio
    {
        public List<Persona> listarConSP(string id)
        {
            List<Persona> lista = new List<Persona>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_ListarPersonal");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Persona aux = new Persona();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.FechaDeNacimiento = (string)datos.Lector["Fecha_Nacimiento"];
                    aux.Dni = (string)datos.Lector["Dni"];
                    aux.Mail = (string)datos.Lector["Mail"];
                    aux.IDUsuario = (Usuario)datos.Lector["IDUsuario"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void agregar(Persona nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ModificarPersonal");
                datos.setearParametro("@ID",  nuevo.Id);
                datos.setearParametro("@APELLIDO", nuevo.Apellido);
                datos.setearParametro("@NOMBRE", nuevo.Nombre);
                datos.setearParametro("@FECHA_NACIMIENTO", nuevo.FechaDeNacimiento);
                datos.setearParametro("@DNI", nuevo.Dni);
                datos.setearParametro("@MAIL", nuevo.Mail);
                datos.setearParametro("@IDUSUARIO", nuevo.IDUsuario);
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

        public void modificar(Persona modificacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ModificarPersonal");
                datos.setearParametro("@ID", modificacion.Id);
                datos.setearParametro("@APELLIDO", modificacion.Apellido);
                datos.setearParametro("@NOMBRE", modificacion.Nombre);
                datos.setearParametro("@FECHA_NACIMIENTO", modificacion.FechaDeNacimiento);
                datos.setearParametro("@DNI", modificacion.Dni);
                datos.setearParametro("@MAIL", modificacion.Mail);
                datos.setearParametro("@IDUSUARIO", modificacion.IDUsuario);
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
                    datos.setearProcedimiento("SP_ReactivarLogicoPersonal");
                else
                    datos.setearProcedimiento("SP_EliminarLogicoPersonal");
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
