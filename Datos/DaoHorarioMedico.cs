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
    }
}
