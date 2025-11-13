using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoLocalidad
    {
        AccesoDatos datos = new AccesoDatos();
        public DataTable getTablaLocalidad(string idProvincia)
        {
            DataTable tabla = datos.CrearTabla("LOCALIDADES", "SELECT * FROM LOCALIDADES WHERE Id_Provincia_L = '" + idProvincia + "'");
            return tabla;
        }
    }
}
