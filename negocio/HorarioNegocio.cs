using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class HorarioNegocio
    {
        public List<Horario> listarConSP(string id = "")
        {
            List<Horario> lista = new List<Horario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if (id == "")
                {
                    datos.setearProcedimiento("SP_ListarHorarios");
                }
                else
                {
                    datos.setearProcedimiento("SP_ListarHorariosxId");
                    datos.setearParametro("@ID", int.Parse(id));
                }
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Horario aux = new Horario();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Hora_Desde = (int)datos.Lector["Hora_Desde"];
                    aux.Hora_Hasta = (int)datos.Lector["Hora_Hasta"];
                    aux.Dia = new Dia();
                    aux.Activo = bool.Parse(datos.Lector["Activo"].ToString());
                    aux.Dia.Id = (int)datos.Lector["Dia"];
                    string nombreDia;
                    switch (aux.Dia.Id)
                    {
                        case 1:
                            nombreDia = "Lunes";
                            break;
                        case 2:
                            nombreDia = "Martes";
                            break;
                        case 3:
                            nombreDia = "Miércoles";
                            break;
                        case 4:
                            nombreDia = "Jueves";
                            break;
                        case 5:
                            nombreDia = "Viernes";
                            break;
                        case 6:
                            nombreDia = "Sábado";
                            break;
                        default:
                            nombreDia = "Domingo";
                            break;
                    }
                    aux.Dia.Nombre = nombreDia;
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void agregar(Horario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_AltaHorario");
                datos.setearParametro("@HORA_DESDE", nuevo.Hora_Desde);
                datos.setearParametro("@HORA_HASTA", nuevo.Hora_Hasta);
                datos.setearParametro("@DIA", nuevo.Dia.Id);
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

        public void modificar(Horario modificacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ModificarHorario");
                datos.setearParametro("@ID", modificacion.Id);
                datos.setearParametro("@HORA_DESDE", modificacion.Hora_Desde);
                datos.setearParametro("@HORA_HASTA", modificacion.Hora_Hasta);
                datos.setearParametro("@DIA", modificacion.Dia.Id);
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
                    datos.setearProcedimiento("SP_ReactivarLogicoHorario");
                else
                    datos.setearProcedimiento("SP_EliminarLogicoHorario");
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

        public List<string> cargarddlFecha(int idEspecialidad, int idMedico, int idPaciente, DateTime fecha)
        {

            List<string> lista = new List<string>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_CargaDDLFecha");
                datos.setearParametro("@IDESPECIALIDAD", idEspecialidad);
                datos.setearParametro("@IDMEDICO", idMedico);
                datos.setearParametro("@IDPACIENTE", idPaciente);
                datos.setearParametro("@DIA", fecha);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    lista.Add(datos.Lector["Hora"].ToString() + ":00 hrs.");
                }
                return lista;

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
