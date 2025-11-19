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
            try
            {
                if (dao.ExistePaciente(paciente.getDni()))

                {
                    return false;
                }
                int filasAfectadas = dao.AgregarPaciente(paciente);
                return filasAfectadas == 1;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            
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
        public DataTable FiltrarPaciente(string idProvincia, string idLocalidad)
        {
            try
            {
                return dao.FiltrarPaciente(idProvincia, idLocalidad);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public DataTable BusquedaPaciente(string busqueda)
        {
            try
            {
                return dao.BusquedaPacientes(busqueda);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        //DAR DE BAJA PACIENTE
        public bool BajaPaciente(Paciente paciente)
        {
            try
            {
                return dao.BajaPaciente(paciente);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataTable CargarPacienteBaja(string dni)
        {
            try
            {
                return dao.getPacienteDarBaja(dni);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
