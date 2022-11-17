using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Paciente : Persona
    {
        public ObraSocial ObraSocial { get; set; }
        public decimal Peso{ get; set; }
        public decimal Altura { get; set; }
        public string Credencial { get; set; }
    }
}
