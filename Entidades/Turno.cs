using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turno
    {
        public string ID { get; set; }
        public string Legajo { get; set; }
        public string DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Sexo { get; set; }
        public DateTime Fecha { get; set; }
        public string Hora { get; set; }
        public string Asistencia { get; set; }
        public string Observaciones { get; set; }
        public bool Estado { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Provincia { get; set; }
    }
}
