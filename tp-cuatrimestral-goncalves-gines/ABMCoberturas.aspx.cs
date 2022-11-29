using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class ABMCoberturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de admin para acceder a esta página");
                Response.Redirect("Error.aspx", false);
            }
            
            txtId.Enabled = false;
            btnActivacion.Visible = false;
            try
            {
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    ObraSocialNegocio negocio = new ObraSocialNegocio();
                    ObraSocial obraSocialSeleccionada = (negocio.listarConSP(id))[0];

                    txtId.Text = id;
                    txtNombre.Text = obraSocialSeleccionada.Nombre;
                    txtSigla.Text = obraSocialSeleccionada.Sigla;
                    txtCUIT.Text = obraSocialSeleccionada.Cuit;
                    txtTelefono.Text = obraSocialSeleccionada.Telefono;
                    txtDireccion.Text = obraSocialSeleccionada.Direccion;
                    txtMail.Text = obraSocialSeleccionada.Mail;

                    //Guardo en session para conocer luego el estado de activación o inactivación
                    Session.Add("ObraSocialSeleccionada", obraSocialSeleccionada);

                    if (!obraSocialSeleccionada.Activo)
                    {
                        btnActivacion.Text = "Reactivar";
                        btnActivacion.CssClass = "btn btn-warning";
                    }
                    btnActivacion.Visible = true;

                }
            }catch(Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Coberturas.aspx", false);
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                ObraSocial obraSocial = new ObraSocial();
                ObraSocialNegocio negocio = new ObraSocialNegocio();

                obraSocial.Nombre = txtNombre.Text;
                obraSocial.Sigla = txtSigla.Text;
                obraSocial.Cuit = txtCUIT.Text;
                obraSocial.Telefono = txtTelefono.Text;
                obraSocial.Direccion = txtDireccion.Text;
                obraSocial.Mail = txtMail.Text;

                if (Request.QueryString["id"] != null)
                {
                    obraSocial.Id = int.Parse(txtId.Text);
                    negocio.modificar(obraSocial);
                }
                else negocio.agregar(obraSocial);
                Response.Redirect("Coberturas.aspx", false);
            }
            catch(Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnActivacion_Click(object sender, EventArgs e)
        {
            try
            {
                ObraSocialNegocio negocio = new ObraSocialNegocio();
                ObraSocial ObraSocialSeleccionada = (ObraSocial)Session["ObraSocialSeleccionada"];
                negocio.eliminarLogico(ObraSocialSeleccionada.Id, !ObraSocialSeleccionada.Activo);
                Response.Redirect("Coberturas.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}