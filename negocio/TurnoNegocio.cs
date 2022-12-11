using dominio;
using System;
using System.Collections;
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
                    aux.Id = (int)datos.Lector["ID"];
                    aux.Paciente = new Paciente();
                    aux.Paciente.Id = (int)datos.Lector["IDPACIENTE"];    
                    aux.Paciente.Nombre = (string)datos.Lector["APELLIDOPACIENTE"];
                    aux.Paciente.Apellido = (string)datos.Lector["NOMBREPACIENTE"];
                    aux.Paciente.Mail = (string)datos.Lector["MAILPACIENTE"];
                    aux.Paciente.Dni = (int)datos.Lector["DNIPACIENTE"];
                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Id = (int)datos.Lector["IDESPECIALIDAD"];
                    aux.Especialidad.Nombre = (string)datos.Lector["ESPECIALIDAD"];
                    aux.FechaSolicitado = Convert.ToDateTime(datos.Lector["FECHA_SOLICITADO"]);
                    aux.Fecha = Convert.ToDateTime(datos.Lector["FECHA"]);
                    aux.Hora = int.Parse(datos.Lector["HORA"].ToString());
                    aux.Medico = new Medico();
                    aux.Medico.Nombre = (string)datos.Lector["NOMBREMEDICO"];
                    aux.Medico.Apellido = (string)datos.Lector["APELLIDOMEDICO"];
                    aux.Observaciones = (string)datos.Lector["OBSERVACIONES"];
                    aux.Estado = new EstadoTurno();
                    aux.Estado.Id = (int)datos.Lector["IDESTADO"];
                    aux.Estado.Nombre = (string)datos.Lector["ESTADO"];
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
                datos.setearParametro("@IDPACIENTE", nuevo.Paciente.Id);
                datos.setearParametro("@IDESPECIALIDAD", nuevo.Especialidad.Id);
                datos.setearParametro("@FECHA_SOLICITADO", nuevo.FechaSolicitado);
                datos.setearParametro("@FECHA", nuevo.Fecha);
                datos.setearParametro("@HORA", nuevo.Hora);
                datos.setearParametro("@IDMEDICO", nuevo.Medico.Id);    
                datos.setearParametro("@OBSERVACIONES", nuevo.Observaciones);
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
        public void reagendar(Turno modificacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ReagendarTurno");
                datos.setearParametro("@ID", modificacion.Id);
                datos.setearParametro("@IDPACIENTE", modificacion.Paciente.Id);
                datos.setearParametro("@IDESPECIALIDAD", modificacion.Especialidad.Id);
                datos.setearParametro("@FECHA", modificacion.Fecha);
                datos.setearParametro("@HORA", modificacion.Hora);
                datos.setearParametro("@IDMEDICO", modificacion.Medico.Id);
                datos.setearParametro("@OBSERVACIONES", modificacion.Observaciones);
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


        public void actualizarObsEstado(Turno modificacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ModificarTurnoObsEstado");
                datos.setearParametro("@ID", modificacion.Id);
                datos.setearParametro("@OBSERVACIONES", modificacion.Observaciones);
                datos.setearParametro("@ESTADO", modificacion.Estado.Id);
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

        public List<string> horariosDisponibles()
        {
            List<string> horarios = new List<string>();
            for (int x = 0; x <= 23; x++)
            {
                if (x < 10) horarios.Add(string.Format("0{0}:00", x));
                else horarios.Add(string.Format("{0}:00", x));
            }
            return horarios;
        }

        public List<Turno> ListarTurnosMedico(string id = "")
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

                    datos.setearProcedimiento("SP_ListarTurnoMedicoxId");
                    datos.setearParametro("@IDMEDICO", int.Parse(id));
                }
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.Id = (int)datos.Lector["ID"];
                    aux.Paciente = new Paciente();
                    aux.Paciente.Id = (int)datos.Lector["IDPACIENTE"];
                    aux.Paciente.Nombre = (string)datos.Lector["APELLIDOPACIENTE"];
                    aux.Paciente.Apellido = (string)datos.Lector["NOMBREPACIENTE"];
                    aux.Paciente.Mail = (string)datos.Lector["MAILPACIENTE"];
                    aux.Paciente.Dni = (int)datos.Lector["DNIPACIENTE"];
                    aux.Especialidad = new Especialidad();
                    aux.Especialidad.Id = (int)datos.Lector["IDESPECIALIDAD"];
                    aux.Especialidad.Nombre = (string)datos.Lector["ESPECIALIDAD"];
                    aux.FechaSolicitado = Convert.ToDateTime(datos.Lector["FECHA_SOLICITADO"]);
                    aux.Fecha = Convert.ToDateTime(datos.Lector["FECHA"]);
                    aux.Hora = int.Parse(datos.Lector["HORA"].ToString());
                    aux.Medico = new Medico();
                    aux.Medico.Nombre = (string)datos.Lector["NOMBREMEDICO"];
                    aux.Medico.Apellido = (string)datos.Lector["APELLIDOMEDICO"];
                    aux.Observaciones = (string)datos.Lector["OBSERVACIONES"];
                    aux.Estado = new EstadoTurno();
                    aux.Estado.Id = (int)datos.Lector["IDESTADO"];
                    aux.Estado.Nombre = (string)datos.Lector["ESTADO"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Turno> buscarIdMedico(string id)
        {
            List<Turno> lista= new List<Turno>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_UsuarioMedicoxId");
                datos.setearParametro("@IDUSUARIO", id);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Turno aux = new Turno();
                    aux.Medico = new Medico();
                    aux.Medico.Id = (int)datos.Lector["IDMEDICO"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch(Exception ex){

                throw ex;
            }


        }

    }
}
