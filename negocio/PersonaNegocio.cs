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
        public List<Persona> listarConSP()
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
                    aux.FechaDeNacimiento = (DateTime)datos.Lector["Fecha_Nacimiento"];
                    aux.Dni = (string)datos.Lector["Dni"];
                    aux.Mail = (string)datos.Lector["Mail"];
                    aux.Usuario = new Usuario();
                    aux.Usuario.Password = (string)datos.Lector["Pass"];
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
