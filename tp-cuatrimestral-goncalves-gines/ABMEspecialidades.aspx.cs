﻿using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class ABMEspecialidades : System.Web.UI.Page
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
                    EspecialidadNegocio negocio = new EspecialidadNegocio();
                    Especialidad especialidadSeleccionada = (negocio.listarConSP(id))[0];

                    txtId.Text = id;
                    txtNombre.Text = especialidadSeleccionada.Nombre;

                    //Guardo en session para conocer luego el estado de activación o inactivación
                    Session.Add("EspecialidadSeleccionada", especialidadSeleccionada);

                    if (!especialidadSeleccionada.Activo)
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
            Response.Redirect("Especialidades.aspx");
        }

        protected void btnActivacion_Click(object sender, EventArgs e)
        {
            try
            {
                EspecialidadNegocio negocio = new EspecialidadNegocio();
                Especialidad seleccionada = (Especialidad)Session["EspecialidadSeleccionada"];

                negocio.eliminarLogico(seleccionada.Id, !seleccionada.Activo);
                Response.Redirect("Especialidades.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Especialidad especialidad = new Especialidad();
                EspecialidadNegocio negocio = new EspecialidadNegocio();

                especialidad.Nombre = txtNombre.Text;

                if (Request.QueryString["id"] != null)
                {
                    especialidad.Id = int.Parse(txtId.Text);
                    negocio.modificar(especialidad);
                }
                else negocio.agregar(especialidad);
                Response.Redirect("Especialidades.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    }
}