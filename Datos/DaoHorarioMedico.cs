using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoHorarioMedico
    {
        AccesoDatos datos = new AccesoDatos();
        public DataTable getTablaHorarioMedico()
        {
            DataTable tabla = datos.CrearTabla("HORARIO_MEDICOS", "Select * FROm HORARIO_MEDICOS");
            return tabla;
        }

        public int AgregarHorario(HorarioMedico horario)
        {
            int filasAfectadas = 0;
            try
            {
                datos.openConexion();
                datos.setearConsulta("INSERT INTO HORARIO_MEDICOS (Nro_Legajo_HM, Id_Dia_HM, HorarioInicio_HM, HorarioFinal_HM) " +
                    "VALUES (@legajo, @dia, @inicio, @fin)");
                datos.setearParametro("@legajo", horario.getLegajo());
                datos.setearParametro("@dia", horario.getIdDia());
                datos.setearParametro("@inicio", horario.getHoraInicio());
                datos.setearParametro("@fin", horario.getHoraFin());

                filasAfectadas = datos.ejecutarAccion();
            } catch (Exception ex) { throw ex; }
            finally { datos.closeConexion(); }

            return filasAfectadas;
        }
    }
}
