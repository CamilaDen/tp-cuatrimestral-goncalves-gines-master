using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Turno
    {
        public int Id { get; set; }
        public Paciente IdPaciente { get; set; }
        public Especialidad Especialidad { get; set; }
        public DateTime FechaSolicitado { get; set; }
        public DateTime Fecha { get; set; }
        public int Hora { get; set; }
        public Medico IdMedico { get; set; }
        public string Observaciones { get; set; }
        public string Estado { get; set; }
    }
}
