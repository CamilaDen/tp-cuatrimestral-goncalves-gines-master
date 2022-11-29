using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{   public enum TipoPerfil{ ADMINISTRADOR = 1, MEDICO = 2, RECEPCIONISTA = 3 }
    public class Usuario
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Password { get; set; }
        public Perfil Perfil { get; set; }
        public bool Activo { get; set; }

        public Usuario(string user, string pass/*, int tipoAcceso*/)
        {
            Nombre = user;
            Password = pass;
            //switch (tipoAcceso)
            //{
            //    case (int)TipoPerfil.ADMINISTRADOR:
            //        Perfil.Id = (int)TipoPerfil.ADMINISTRADOR;
            //        break;
            //    case (int)TipoPerfil.MEDICO:
            //        Perfil.Id = (int)TipoPerfil.MEDICO;
            //        break;
            //    case (int)TipoPerfil.RECEPCIONISTA:
            //        Perfil.Id = (int)TipoPerfil.RECEPCIONISTA;
            //        break;
            //}
        }

        public Usuario()
        {

        }

    }


}
