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
        public Usuario Usuario { get; set; }
        public string Apellidos { get; set; }
        public string Nombres { get; set; }
        public DateTime FechaDeNacimiento { get; set; }
        public string Dni { get; set; }
        public string Mail { get; set; }
    }
}
