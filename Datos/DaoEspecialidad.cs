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
            try
            {
                DataTable tabla = datos.CrearTabla("ESPECIALIDADES", "Select * From ESPECIALIDADES");
                return tabla;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string GetEspecialidad(string idEspecialidad)
        {
            string descEspecialidad = "";
            SqlCommand cmd = new SqlCommand();
            SqlDataReader rd = null;
            datos.PrepararConsulta(cmd, "SELECT * FROM ESPECIALIDADES WHERE Id_Especialidad = '" + idEspecialidad + "'");
            try
            {
                rd = datos.EjecutarLectura(cmd);
                if (rd != null && rd.Read())
                {
                    descEspecialidad = (string)rd["Descripcion_E"];
                }
            }
            catch (Exception ex) { throw ex; }
            finally { datos.CerrarConexion(cmd.Connection, rd); } //correcion para que siempre se cierre el rd en el caso caso que de null la lectura. 
            return descEspecialidad;
        }
    }
}
