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
    public partial class ABMMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            btnActivacion.Visible = false;

            try
            {
                if (!IsPostBack)
                {

                    EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();
                    dgvEspecialidad.DataSource = especialidadNegocio.listarConSP();
                    dgvEspecialidad.DataBind();

                    HorarioNegocio horarioNegocio = new HorarioNegocio();
                    dgvHorario.DataSource = horarioNegocio.listarConSP();
                    dgvHorario.DataBind();


                    string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                    if (id != "")
                    {
                        MedicoNegocio negocio = new MedicoNegocio();
                        Medico medicoSeleccionado = (negocio.listarConSP(id))[0];

                        txtId.Text = id;
                        txtApellido.Text = medicoSeleccionado.Apellido;
                        txtNombre.Text = medicoSeleccionado.Nombre;
                        txtDNI.Text = medicoSeleccionado.Dni.ToString();
                        txtFNacimiento.Text = medicoSeleccionado.FechaDeNacimiento.ToString("yyyy-MM-dd");
                        txtMail.Text = medicoSeleccionado.Mail;
                        txtMatricula.Text = medicoSeleccionado.Matricula;
                        txtPass.Text = medicoSeleccionado.Usuario.Password;
                        txtPass.Attributes["type"] = "password";

                        string[] IdHorarios = medicoSeleccionado.Horarios.Split(',');
                        string[] IdEspecialidades = medicoSeleccionado.Especialidades.Split(',');

                        foreach (GridViewRow row in dgvHorario.Rows)
                        {
                            foreach (var IdHorario in IdHorarios)
                            {
                                var check = row.FindControl("cbSelect") as CheckBox;
                                if (row.Cells[1].Text.ToString() == IdHorario)
                                {
                                    check.Checked = true;
                                }
                            }
                        }

                        foreach (GridViewRow row in dgvEspecialidad.Rows)
                        {
                            foreach (var IdEspecialidad in IdEspecialidades)
                            {
                                var check = row.FindControl("cbSelect") as CheckBox;
                                if (row.Cells[1].Text.ToString() == IdEspecialidad)
                                {
                                    check.Checked = true;
                                }
                            }
                        }

                        //Guardo en session para conocer luego el estado de activación o inactivación
                        Session.Add("MedicoSeleccionado", medicoSeleccionado);

                        if (!medicoSeleccionado.Activo)
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
            Response.Redirect("Medicos.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Medico medico = new Medico();
                MedicoNegocio negocio = new MedicoNegocio();

                medico.Apellido = txtApellido.Text;
                medico.Nombre = txtNombre.Text;
                medico.Dni = int.Parse(txtDNI.Text);
                medico.Mail = txtMail.Text;
                medico.FechaDeNacimiento = DateTime.Parse(txtFNacimiento.Text);
                medico.Matricula = txtMatricula.Text;
                medico.Usuario = new Usuario();
                medico.Usuario.Password = txtPass.Text;


                foreach (GridViewRow row in dgvHorario.Rows)
                {
                    var check = row.FindControl("cbSelect") as CheckBox;
                    if (check != null && check.Checked)
                    {
                        medico.Horarios += row.Cells[1].Text + ",";
                    }
                }


                foreach (GridViewRow row in dgvEspecialidad.Rows)
                {
                    var check = row.FindControl("cbSelect") as CheckBox;
                    if (check != null && check.Checked)
                    {
                        medico.Especialidades += row.Cells[1].Text + ",";
                    }
                }


                if (Request.QueryString["id"] != null)
                {
                    medico.Id = int.Parse(txtId.Text);
                    negocio.modificar(medico);
                }
                else negocio.agregar(medico);
                Response.Redirect("Medicos.aspx");
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
                MedicoNegocio negocio = new MedicoNegocio();
                Medico MedicoSeleccionado = (Medico)Session["MedicoSeleccionado"];
                negocio.eliminarLogico(MedicoSeleccionado.Id, !MedicoSeleccionado.Activo);
                Response.Redirect("Medicos.aspx");

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}