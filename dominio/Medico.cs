using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Medico : Persona
    {
        public string Matricula { get; set; }
        public string Horarios { get; set; }
        public string Especialidades { get; set; }

    }
}
