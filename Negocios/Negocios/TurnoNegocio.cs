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

        public DataTable GetTablaTurnos()
        {
            DaoTurnos daoTurnos = new DaoTurnos();
            return daoTurnos.getTablaTurnos();
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
