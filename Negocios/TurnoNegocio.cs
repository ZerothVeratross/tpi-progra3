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
            DaoTurnos dao = new DaoTurnos();
            return dao.AgregarTurno(turno);
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
    }
}
