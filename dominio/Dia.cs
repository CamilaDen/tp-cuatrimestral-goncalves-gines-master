using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Dia
    {
   
        public Dia(int Id, string Nombre)
        {
            this.Id = Id;
            this.Nombre = Nombre;
        }

        public Dia()
        {

        }

        public int Id { get; set; }
        public string Nombre { get; set; }
    }
}
