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

        //AGREGAR PACIENTE
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

        //MODFICCAR PACIENTE
        public Paciente GetPacientePorDNI(string dni)
        {
            try
            {
                return dao.GetPacientePorDNI(dni);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public bool modificarPaciente(Paciente paciente)
        {
            try
            {
                return dao.ModificarPaciente(paciente);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool eliminarPaciente(Paciente paciente)
        {
            return false;
        }
    }
}
