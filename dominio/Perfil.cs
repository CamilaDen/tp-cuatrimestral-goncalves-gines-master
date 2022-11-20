using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    //enum TipoPerfil{ ADMINISTRADOR = 1, MEDICO = 2, RECEPCIONISTA = 3 }
    public class Perfil
    {
        public int Id { get; set; }
        public string Nombre { get; set; }      
        public bool Activo { get; set; }
    }
}
