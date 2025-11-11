using Datos;
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
        public DataTable getTablaHorarioMedicos()
        {
            DaoHorarioMedico daoHorarioMedico = new DaoHorarioMedico();
            return daoHorarioMedico.getTablaHorarioMedico();
        }
    }
}
