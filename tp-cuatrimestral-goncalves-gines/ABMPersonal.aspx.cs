using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class ABMPersonal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            btnActivacion.Visible = false;
            try
            {
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    PersonaNegocio negocio = new PersonaNegocio();
                    Persona personaSeleccionada = (negocio.listarConSP(id))[0];

                    txtId.Text = id;
                    txtApellidoPersonal.Text = personaSeleccionada.Apellido;
                    txtNombrePersonal.Text = personaSeleccionada.Nombre;
                    txtDNI.Text = personaSeleccionada.Dni;
                    txtFNacimiento = personaSeleccionada.FechaDeNacimiento;
                    txtMail = personaSeleccionada.Mail;
                    txtIDUsuario = personaSeleccionada.IDUsuario;

                    //Guardo en session para conocer luego el estado de activación o inactivación
                    Session.Add("PersonalSeleccionado", personaSeleccionada);

                    if (!personaSeleccionada.Activo)
                    {
                        btnActivacion.Text = "Reactivar";
                        btnActivacion.CssClass = "btn btn-warning";
                    }
                    btnActivacion.Visible = true;

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Personal.aspx");
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Persona personal = new Persona();
                PersonaNegocio negocio = new PersonaNegocio();
                personal.Id = int.Parse(txtId.Text);
                personal.Apellido = txtApellidoPersonal.Text;
                personal.Nombre = txtNombrePersonal.Text;
                personal.Dni = txtDNI.Text;
                personal.Mail = txtMail.Text;
                personal.FechaDeNacimiento = txtFNacimiento.Text;

                if (Request.QueryString["id"] != null)
                {
                    personal.Id = int.Parse(txtId.Text);
                    negocio.modificar(personal);
                }
                else negocio.agregar(personal);
                Response.Redirect("Personal.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnActivacion_Click(object sender, EventArgs e)
        {
            try
            {
                PersonaNegocio negocio = new PersonaNegocio();
                Persona PersonalSeleccionado = (Persona)Session["PersonalSeleccionado"];

                negocio.eliminarLogico(PersonalSeleccionado.Id, !PersonalSeleccionado.Activo);
                Response.Redirect("Personal.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }

}
