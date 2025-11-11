using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class PacienteNegocio
    {

        public DataTable getTablaPaciente()
        {
            DaoPaciente daoPaciente = new DaoPaciente();
            return daoPaciente.getTablaPacientes();
        }
        public void agregarPaciente(Paciente paciente)
        {

        }

        public void modificarPaciente(Paciente paciente)
        {

        }

        public bool eliminarPaciente(Paciente paciente)
        {
            return false;
        }

        public bool reactivarPaciente(Paciente paciente)
        {
            return false;
        }
    }
}
