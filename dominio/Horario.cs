using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Horario
    {
        public int Id{ get; set; }
        public int Hora_Desde { get; set; }
        public int Hora_Hasta { get; set; }
        public int Dia { get; set; }
        public bool Activo { get; set; }
    }
}
