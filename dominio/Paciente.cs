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
        public Turno Turno { get; set; }
        public float Peso{ get; set; }
        public float Altura { get; set; }
        public string Credencial { get; set; }
        public string GrupoSanguineo { get; set; }
        public bool Activo { get; set; }
    }
}
