using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoPaciente
    {
        AccesoDatos datos = new AccesoDatos();
        public DataTable getTablaPacientes()
        {
            DataTable tabla = datos.CrearTabla("PACIENTES", "Select * FROM PACIENTES");
            return tabla;
        }

    }
}
