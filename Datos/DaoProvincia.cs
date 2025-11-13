using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoProvincia
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaProvincia()
        {
            DataTable tabla = datos.CrearTabla("PROVINCIAS", "Select * FROM PROVINCIAS");
            return tabla;
        }
    }
}
