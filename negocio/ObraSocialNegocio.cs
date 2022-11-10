using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace negocio
{
    public class ObraSocialNegocio
    {
        public List<ObraSocial> listarConSP(string id = "")
        {
            List<ObraSocial> lista = new List<ObraSocial>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                if (id == "")
                {
                    datos.setearProcedimiento("SP_ListarObraSocial");
                }
                else
                {
                    datos.setearProcedimiento("SP_ListarObraSocialxId");
                    datos.setearParametro("@ID", int.Parse(id));
                }
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    ObraSocial aux = new ObraSocial();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Sigla = (string)datos.Lector["Sigla"];
                    aux.Cuit = (string)datos.Lector["Cuit"];
                    aux.Telefono = (string)datos.Lector["Telefono"];
                    aux.Direccion = (string)datos.Lector["Direccion"];
                    aux.Mail = (string)datos.Lector["Mail"];
                    aux.Activo = bool.Parse(datos.Lector["Activo"].ToString());
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void agregar(ObraSocial nuevo )
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_AltaObraSocial");
                datos.setearParametro("@NOMBRE", nuevo.Nombre);
                datos.setearParametro("@SIGLA", nuevo.Sigla);
                datos.setearParametro("@CUIT", nuevo.Cuit);
                datos.setearParametro("@TELEFONO", nuevo.Telefono);
                datos.setearParametro("@DIRECCION", nuevo.Direccion);
                datos.setearParametro("@MAIL", nuevo.Mail);
                datos.ejecutarAccion();
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void modificar(ObraSocial modificacion)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_ModificarObraSocial");
                datos.setearParametro("@ID", modificacion.Id);
                datos.setearParametro("@NOMBRE", modificacion.Nombre);
                datos.setearParametro("@SIGLA", modificacion.Sigla);
                datos.setearParametro("@CUIT", modificacion.Cuit);
                datos.setearParametro("@TELEFONO", modificacion.Telefono);
                datos.setearParametro("@DIRECCION", modificacion.Direccion);
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
                    datos.setearProcedimiento("SP_ReactivarLogicoObraSocial");
                else
                    datos.setearProcedimiento("SP_EliminarLogicoObraSocial");
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
