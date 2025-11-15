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

        //LISTADO PACIENTE
        public DataTable getTablaPacientes()
        {
            try
            {
                return dao.ObtenerTodosPacientes();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public DataTable FiltrarPaciente(string dni, string nombre, string apellido, string nacionalidad, string idProvincia, string idLocalidad)
        {
            try
            {
                return dao.FiltrarPaciente(dni, nombre, apellido, nacionalidad, idProvincia, idLocalidad);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        //DAR DE BAJA PACIENTE
        public bool eliminarPaciente(Paciente paciente)
        {
            return false;
        }
    }
}
