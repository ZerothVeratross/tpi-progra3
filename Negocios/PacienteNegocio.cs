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

        DaoPaciente dao = new DaoPaciente();

        public DataTable getTablaPaciente()
        {
            DaoPaciente daoPaciente = new DaoPaciente();
            return daoPaciente.getTablaPacientes();
        }
        public bool agregarPaciente(Paciente paciente)
        {

            if (dao.ExistePaciente(paciente.getDni()))

            {
                return false;
            }
            int filasAfectadas = dao.AgregarPaciente(paciente);
            return filasAfectadas == 1;
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
