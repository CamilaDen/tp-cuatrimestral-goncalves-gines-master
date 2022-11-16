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
        public List<Medico> listarConSP()
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_ListarMedicos");
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
                    aux.Persona.FechaDeNacimiento = (string)datos.Lector["Fecha_Nacimiento"];
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
    }
}
