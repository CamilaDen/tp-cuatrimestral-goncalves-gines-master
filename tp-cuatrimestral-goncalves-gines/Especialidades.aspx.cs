﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace tp_cuatrimestral_goncalves_gines
{
    public partial class Especialidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    EspecialidadNegocio negocio = new EspecialidadNegocio();
                    Session.Add("listaEspecialidad", negocio.listarConSP());
                    dgvEspecialidades.DataSource = Session["listaEspecialidad"];
                    dgvEspecialidades.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMEspecialidades.aspx");
        }

        protected void dgvEspecialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvEspecialidades.SelectedDataKey.Value.ToString();
            Response.Redirect("ABMEspecialidades.aspx?id=" + id);
        }

        protected void btnBuscarRapido_Click(object sender, EventArgs e)
        {
            List<Especialidad> listaFiltrada = ((List<Especialidad>)Session["listaEspecialidad"]);
            listaFiltrada = listaFiltrada.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            if (ddlEstado.SelectedItem.ToString() == "Activo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => x.Activo);
            }
            else if (ddlEstado.SelectedItem.ToString() == "Inactivo")
            {
                listaFiltrada = listaFiltrada.FindAll(x => !x.Activo);
            }
            dgvEspecialidades.DataSource = listaFiltrada;
            dgvEspecialidades.DataBind();
        }

    }
}