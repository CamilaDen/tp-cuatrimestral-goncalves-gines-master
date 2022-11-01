﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Medico : Persona
    {
        public string Matricula { get; set; }
        public Horario Horario { get; set; }
        public Especialidad Especialidad { get; set; }
        public Persona Persona { get; set; }
        public bool Activo { get; set; }

    }
}
