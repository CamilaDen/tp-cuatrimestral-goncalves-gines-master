using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class PacienteNegocio
    {
        public List<Paciente> listarConSP(string id = "")
        {
            List<Paciente> lista = new List<Paciente>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if (id == "")
                {
                    datos.setearProcedimiento("SP_ListarPacientes");
                }
                else
                {
                    datos.setearProcedimiento("SP_ListarPacientesxId");
                    datos.setearParametro("@ID", int.Parse(id));
                }
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Paciente aux = new Paciente();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.FechaDeNacimiento = Convert.ToDateTime(datos.Lector["Fecha_Nacimiento"]);
                    aux.Dni = (int)datos.Lector["Dni"];
                    aux.Mail = (string)datos.Lector["Mail"];
                    aux.Activo = (bool)datos.Lector["Activo"];
                    aux.ObraSocial = new ObraSocial();
                    aux.ObraSocial.Id = (int)datos.Lector["IdObraSocial"];
                    aux.ObraSocial.Nombre = (string)datos.Lector["ObraSocial"];
                    aux.Credencial = (string)datos.Lector["Credencial"];
                    aux.Peso = (decimal)datos.Lector["Peso"];
                    aux.Altura = (decimal)datos.Lector["Altura"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void agregar(Paciente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_AltaPaciente");
                datos.setearParametro("@APELLIDO", nuevo.Apellido);
                datos.setearParametro("@NOMBRE", nuevo.Nombre);
                datos.setearParametro("@FECHA_NACIMIENTO", nuevo.FechaDeNacimiento);
                datos.setearParametro("@DNI", nuevo.Dni);
                datos.setearParametro("@MAIL", nuevo.Mail);
                datos.setearParametro("@IDOBRASOCIAL", nuevo.ObraSocial.Id);
                datos.setearParametro("@CREDENCIAL", nuevo.Credencial);
                datos.setearParametro("@PESO", nuevo.Peso);
                datos.setearParametro("@ALTURA", nuevo.Altura);
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

        public void modificar(Paciente modificacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ModificarPaciente");
                datos.setearParametro("@ID", modificacion.Id);
                datos.setearParametro("@APELLIDO", modificacion.Apellido);
                datos.setearParametro("@NOMBRE", modificacion.Nombre);
                datos.setearParametro("@FECHA_NACIMIENTO", modificacion.FechaDeNacimiento);
                datos.setearParametro("@DNI", modificacion.Dni);
                datos.setearParametro("@MAIL", modificacion.Mail);
                datos.setearParametro("@IDOBRASOCIAL", modificacion.ObraSocial.Id);
                datos.setearParametro("@CREDENCIAL", modificacion.Credencial);
                datos.setearParametro("@PESO", modificacion.Peso);
                datos.setearParametro("@ALTURA", modificacion.Altura);
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
                    datos.setearProcedimiento("SP_ReactivarLogicoPaciente");
                else
                    datos.setearProcedimiento("SP_EliminarLogicoPaciente");
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
