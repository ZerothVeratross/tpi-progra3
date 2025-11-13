using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoEspecialidad
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaEspecialidad()
        {
            DataTable tabla = datos.CrearTabla("ESPECIALIDADES", "Select * From ESPECIALIDADES");
            return tabla;
        }

        public string GetEspecialidad(string idEspecialidad)
        {
            string descEspecialidad = "";
            SqlCommand cmd = new SqlCommand();
            datos.PrepararConsulta(cmd, "SELECT * FROM ESPECIALIDADES WHERE Id_Especialidad = '" + idEspecialidad + "'");
            SqlDataReader rd = datos.EjecutarLectura(cmd);
            if (rd != null && rd.Read())
            {
                descEspecialidad = (string)rd["Descripcion_E"];
            }
            datos.CerrarConexion(cmd.Connection);
            return descEspecialidad;
        }
    }
}
