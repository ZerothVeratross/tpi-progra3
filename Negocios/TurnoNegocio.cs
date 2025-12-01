using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class TurnoNegocio
    {
        //CARGAR MEDICOS DISPONIBLES PARA EL DIA Y HORARIO ELEGIDO EN ASIGNACIONTURNOS

        public List<Medico> ObtenerMedicosDisponibles(string idEspecialidad, DateTime fecha, TimeSpan hora)
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.ListarMedicosDisponibles(idEspecialidad, fecha, hora);
        }


        //PARA REGISTRAR UN TURNO NUEVO

        public bool RegistrarTurno(Turno turno)
        {
            bool estado;   
            DaoPaciente daoPaciente = new DaoPaciente();
            estado = daoPaciente.getEstadoPaciente(turno.DNI);
            if(estado == true)
            {
            DaoTurnos dao = new DaoTurnos();
            return dao.AgregarTurno(turno);
            }
            else
            {
                return false;
            }
                          
            
        }

        //PARA OBTENER EL PROXIMO ID DE TURNO

        public string ObtenerProximoId()
        {
            DaoTurnos dao = new DaoTurnos();
            return dao.ObtenerProximoIdTurno();
        }

        public List<Turno> listarTurnos(Medico medico)
        {
            try
            {
                DaoTurnos daoTurnos = new DaoTurnos();
                return daoTurnos.getTurnosPorMedico(medico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Turno> FiltrarTurno(string filtro, string filtro2, string id)
        {
            try
            {
                DaoTurnos daoTurnos = new DaoTurnos();
                return daoTurnos.FiltrarTurno(filtro, filtro2, id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void cargarTurno(Turno turno)
        {

        }

        public void reprogramarTurno(Turno turno)
        {

        }

        public void cancelarTurno(Turno turno)
        {

        }

        public DataTable GenerarInforme(string fechaMenor, string fechaMayor)
        {
            try
            {
                DaoTurnos dao = new DaoTurnos();
                DataTable dt = dao.TablaInforme(fechaMenor, fechaMayor);
                return dt;
            }
            catch (Exception ex) { throw ex; }
        }
    }
}
