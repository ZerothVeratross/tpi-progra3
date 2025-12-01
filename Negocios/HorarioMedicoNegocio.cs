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
        // modificar medico
        public HorarioMedico TraerHorarios(HorarioMedico horarioMedico)
        {
            return dao.TraerHorarioMedico(horarioMedico);
        }
        public List<string> TraerDiasLaborales(List<string> listaDeDias, string legajo)
        {
            return dao.LeerDiasLaborales(listaDeDias, legajo);
        }
        public bool EliminarDiasPorLegajo(string legajo)
        {
            return dao.EliminarDiasPorLegajo(legajo);
        }

        public DataTable GenerarInforme()
        {
            try
            {
                DataTable dt = dao.TablaInforme();
                return dt;
            }
            catch (Exception ex) { throw ex; }
        }
    }
}
