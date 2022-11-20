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
                if (!IsPostBack)
                {
                    PerfilNegocio perfilNegocio = new PerfilNegocio();
                    ddlPerfiles.DataSource = perfilNegocio.listarConSP();
                    ddlPerfiles.DataTextField = "Nombre";
                    ddlPerfiles.DataValueField = "Id";
                    ddlPerfiles.DataBind();

                    string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                    if (id != "")
                    {
                        PersonaNegocio negocio = new PersonaNegocio();
                        Persona personaSeleccionada = (negocio.listarConSP(id))[0];


                        txtId.Text = id;
                        txtApellidoPersonal.Text = personaSeleccionada.Apellido;
                        txtNombrePersonal.Text = personaSeleccionada.Nombre;
                        txtDNI.Text = personaSeleccionada.Dni;
                        txtFNacimiento.Text = personaSeleccionada.FechaDeNacimiento.ToString("yyyy-MM-dd");
                        txtMail.Text = personaSeleccionada.Mail;
                        txtPass.Text = personaSeleccionada.Usuario.Password;
                        txtPass.Attributes["type"] = "password";
                        ddlPerfiles.SelectedValue = personaSeleccionada.Usuario.Perfil.Id.ToString();

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

                personal.Apellido = txtApellidoPersonal.Text;
                personal.Nombre = txtNombrePersonal.Text;
                personal.Dni = txtDNI.Text;
                personal.Mail = txtMail.Text;
                personal.FechaDeNacimiento = DateTime.Parse(txtFNacimiento.Text);
                personal.Usuario = new Usuario();
                personal.Usuario.Password = txtPass.Text;
                personal.Usuario.Perfil = new Perfil();
                personal.Usuario.Perfil.Id = int.Parse(ddlPerfiles.SelectedValue);

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
