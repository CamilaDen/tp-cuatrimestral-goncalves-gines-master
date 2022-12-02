using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{   public enum TipoPerfil{ ADMINISTRADOR = 1, MEDICO = 2, RECEPCIONISTA = 3 }
    public class Usuario : Persona
    {
        public string Password { get; set; }
        public Perfil Perfil { get; set; }
        public Usuario(string email, string pass)
        {
            this.Mail = email;
            this.Password = pass;
        }

        public Usuario()
        {

        }

    }


}
