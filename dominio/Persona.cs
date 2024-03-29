﻿using System;
using System.Collections.Generic;
using System.Data;
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
        public DateTime FechaDeNacimiento { get; set; }
        public int Dni { get; set; }
        public string Mail { get; set; }
        public Usuario Usuario { get; set; }
        public bool Activo { get; set; }
    }
}
