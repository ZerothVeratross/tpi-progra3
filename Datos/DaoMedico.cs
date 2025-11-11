using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    
    public class DaoMedico
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaMedicos()
        {
            DataTable tabla = datos.CrearTabla("Medico", "Select * from Medicos");
            return tabla;
        }
    }
}
