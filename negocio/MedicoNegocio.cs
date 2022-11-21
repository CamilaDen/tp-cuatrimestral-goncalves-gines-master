using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace negocio
{
    public class MedicoNegocio
    {
        public List<Medico> listarConSP(string id = "")
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if (id == "")
                {
                    datos.setearProcedimiento("SP_ListarMedicos");
                }
                else
                {
                    datos.setearProcedimiento("SP_ListarMedicosxId");
                    datos.setearParametro("@ID", int.Parse(id));
                }
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Medico aux = new Medico();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Matricula = (string)datos.Lector["Matricula"];
                    aux.Activo = (bool)datos.Lector["Activo"];
                    aux.Persona = new Persona();
                    aux.Persona.Id = (int)datos.Lector["IdPersona"];
                    aux.Persona.Nombre = (string)datos.Lector["Nombre"];
                    aux.Persona.Apellido = (string)datos.Lector["Apellido"];
                    aux.Persona.FechaDeNacimiento = Convert.ToDateTime(datos.Lector["Fecha_Nacimiento"]);
                    aux.Persona.Dni = (string)datos.Lector["Dni"];
                    aux.Persona.Mail = (string)datos.Lector["Mail"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void agregar(Medico nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_AltaMedico");
                datos.setearParametro("@APELLIDO", nuevo.Apellido);
                datos.setearParametro("@NOMBRE", nuevo.Nombre);
                datos.setearParametro("@FECHA_NACIMIENTO", nuevo.FechaDeNacimiento);
                datos.setearParametro("@DNI", nuevo.Dni);
                datos.setearParametro("@MAIL", nuevo.Mail);
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

        public void modificar(Medico modificacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ModificarMedico");
                datos.setearParametro("@ID", modificacion.Id);
                datos.setearParametro("@APELLIDO", modificacion.Apellido);
                datos.setearParametro("@NOMBRE", modificacion.Nombre);
                datos.setearParametro("@FECHA_NACIMIENTO", modificacion.FechaDeNacimiento);
                datos.setearParametro("@DNI", modificacion.Dni);
                datos.setearParametro("@MAIL", modificacion.Mail);
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
                    datos.setearProcedimiento("SP_ReactivarLogicoMedico");
                else
                    datos.setearProcedimiento("SP_EliminarLogicoMedico");
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
