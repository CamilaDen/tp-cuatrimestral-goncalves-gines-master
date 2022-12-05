using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class EstadoTurnoNegocio
    {
        public List<EstadoTurno> listarConSP(string id = "")
        {
            List<EstadoTurno> lista = new List<EstadoTurno>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if (id == "")
                {
                    datos.setearProcedimiento("SP_ListarEstadoTurno");
                }
                else
                {
                    datos.setearProcedimiento("SP_ListarEstadoTurnoxId");
                    datos.setearParametro("@ID", int.Parse(id));
                }
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    EstadoTurno aux = new EstadoTurno();
                    aux.Id = (int)datos.Lector["ID"];
                    aux.Nombre = (string)datos.Lector["NOMBRE"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
