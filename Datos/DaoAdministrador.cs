using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoAdministrador
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaAdministrador()
        {
            DataTable tabla = datos.CrearTabla("ADMINISTRADORES", "Select * FROm ADMINISTRADORES");
            return tabla;
        }
    }
}
