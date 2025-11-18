using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
            try
            {
                DataTable tabla = datos.CrearTabla("LOCALIDADES", "SELECT * FROM LOCALIDADES WHERE Id_Provincia_L = '" + idProvincia + "'");
                return tabla;
            }
            catch (Exception ex)
            {
                throw ex;
            }  
        }

        public string GetLocalidad(string idLocalidad)
        {
            string descLocalidad = "";
            SqlCommand cmd = new SqlCommand();
            SqlDataReader rd = null;
            datos.PrepararConsulta(cmd, "SELECT * FROM LOCALIDADES WHERE Id_Localidad = '" + idLocalidad + "'");
            try
            {
                rd = datos.EjecutarLectura(cmd);
                if (rd != null && rd.Read())
                {
                    descLocalidad = (string)rd["Descripcion_L"];
                }
            }
            catch (Exception ex) { throw ex; }
            finally {
                datos.CerrarConexion(cmd.Connection, rd);
            }
            return descLocalidad;
        }
    }
}
