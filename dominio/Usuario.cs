using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Usuario
    {
        public int Id { get; set; }
        public Perfil Perfil { get; set; }
        public string Password { get; set; }
        public bool Activo { get; set; }
    }
}
