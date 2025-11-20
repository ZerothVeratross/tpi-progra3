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
