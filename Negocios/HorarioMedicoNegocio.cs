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
            try
            {
                return dao.TraerHorarioMedico(horarioMedico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<string> TraerDiasLaborales(List<string> listaDeDias, string legajo)
        {
            try
            {
                return dao.LeerDiasLaborales(listaDeDias, legajo);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool EliminarDiasPorLegajo(string legajo)
        {
            try
            {
                return dao.EliminarDiasPorLegajo(legajo);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable GenerarInforme(string[] especialidades)
        {
            try
            {
                DataTable dt = dao.TablaInforme(especialidades);
                return dt;
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable GetHorariosMedico()
        {
            try
            {
                return dao.GetHorariosMedico();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
