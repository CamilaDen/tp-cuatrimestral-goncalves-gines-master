using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Persona
    {
        public int Id { get; set; }
        public string Apellido { get; set; }
        public string Nombre { get; set; }
        public string FechaDeNacimiento { get; set; }
        public string Dni { get; set; }
        public string Mail { get; set; }
        public Usuario IDUsuario { get; set; }
        public bool Activo { get; set; }
    }
}
