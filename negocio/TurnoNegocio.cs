using dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class TurnoNegocio
    {
        public List<Turno> listarConSP(string id = "")
        {
            List<Turno> lista = new List<Turno>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if (id == "")
                {
                    datos.setearProcedimiento("SP_ListarTurno");
                }
                else
                {
                    datos.setearProcedimiento("SP_ListarTurnoxId");
                    datos.setearParametro("@ID", int.Parse(id));
                }
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.IdPaciente = new Paciente();
                    aux.IdPaciente.Nombre = (string)datos.Lector["NOMBRE"];
                    aux.IdPaciente.Apellido = (string)datos.Lector["APELLIDO"];
                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Nombre = (string)datos.Lector["NOMBRE"];
                    aux.FechaSolicitado = Convert.ToDateTime(datos.Lector["FECHA_SOLICITADO"]);
                    aux.Fecha = Convert.ToDateTime(datos.Lector["FECHA"]);
                    byte auxi = (byte)datos.Lector["HORA"];
                    aux.Hora = (int)auxi;
                    aux.IdMedico = new Medico();
                    aux.IdMedico.Apellido = (string)datos.Lector["APELLIDO"];
                    aux.Observaciones = (string)datos.Lector["OBSERVACIONES"];
                    aux.Estado = (string)datos.Lector["NOMBRE"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void agregar(Turno nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_AltaTurno");
                datos.setearParametro("@ID", nuevo.Id);
                datos.setearParametro("@IDPACIENTE", nuevo.IdPaciente.Id);
                datos.setearParametro("@IDESPECIALIDAD", nuevo.Especialidad);
                datos.setearParametro("@FECHA_SOLICITADO", nuevo.FechaSolicitado);
                datos.setearParametro("@FECHA", nuevo.Fecha);
                datos.setearParametro("@HORA", nuevo.Hora);
                datos.setearParametro("@IDMEDICO", nuevo.IdMedico.Id);
                datos.setearParametro("@OBERVACIONES", nuevo.Observaciones);
                datos.setearParametro("@ESTADO", nuevo.Estado);
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

        public void modificar(Turno modificacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ModificarTurno");
                datos.setearParametro("@ID", modificacion.Id);
                datos.setearParametro("@IDPACIENTE", modificacion.IdPaciente.Id);
                datos.setearParametro("@IDESPECIALIDAD", modificacion.Especialidad);
                datos.setearParametro("@FECHA_SOLICITADO", modificacion.FechaSolicitado);
                datos.setearParametro("@FECHA", modificacion.Fecha);
                datos.setearParametro("@HORA", modificacion.Hora);
                datos.setearParametro("@IDMEDICO", modificacion.IdMedico.Id);
                datos.setearParametro("@OBERVACIONES", modificacion.Observaciones);
                datos.setearParametro("@ESTADO", modificacion.Estado);
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
                    datos.setearProcedimiento("SP_ReactivarLogicoTurno");
                else
                    datos.setearProcedimiento("SP_EliminarLogicoTurno");
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
