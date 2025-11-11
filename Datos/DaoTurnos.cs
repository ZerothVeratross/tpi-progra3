using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoTurnos
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaTurnos()
        {
            DataTable tabla = datos.CrearTabla("TURNOS", "Select * FROm TURNOS");
            return tabla;
        }
    }
}
