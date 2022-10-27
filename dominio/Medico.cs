using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Medico : Persona
    {
        public string Matricula { get; set; }
        public List<int> DiasLaborables { get; set; }
        public int HoraDesde { get; set; }
        public int HoraHasta { get; set; }
        public bool Activo { get; set; }

    }
}
