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

    public class HorarioMedicoNegocio
    {
        DaoHorarioMedico dao = new DaoHorarioMedico();

        public DataTable getTablaHorarioMedicos()
        {
            return dao.getTablaHorarioMedico();
        }

        public int AgregarHorario(HorarioMedico horario)
        {
            try
            {
                return dao.AgregarHorario(horario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
