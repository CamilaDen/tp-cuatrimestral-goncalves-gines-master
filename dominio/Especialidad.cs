﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Especialidad
    {
        public int Id { get; set; }
        public Medico Medico { get; set; }
        public string Nombre { get; set; }
        public bool Activo { get; set; }
    }
}
