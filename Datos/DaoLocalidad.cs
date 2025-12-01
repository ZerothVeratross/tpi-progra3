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
                datos.CerrarConexion(cmd.Connection, rd);//puse el cierre del reader al final por si da null la lectura no queda abierto y
                                                         //luego falla el cierre de la conexion por el rd abierto.
            }
            return descLocalidad;
        }

        public DataTable TablaInforme()
        {
            DataTable dt = new DataTable();
            string consulta = "SELECT l.Descripcion_L AS Localidad, COUNT(*) AS Pacientes " +
                "FROM LOCALIDADES l LEFT JOIN PACIENTES p ON l.Id_Localidad = p.Id_Localidad_P " +
                "WHERE p.Estado_P = 1 GROUP BY l.Descripcion_L";

            try
            {
                datos.openConexion();
                datos.setearConsulta(consulta);

                datos.ejecutarLectura();
                dt.Load(datos.Lector);
            }
            catch (Exception ex) { throw ex; }
            finally { datos.closeConexion(); }

            return dt;
        }
    }
}
