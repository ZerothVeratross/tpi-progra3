using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
            try
            {
                DataTable tabla = datos.CrearTabla("PROVINCIAS", "Select * FROM PROVINCIAS");
                return tabla;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string GetProvincia(string idProvincia)
        {
            string descProvincia = "";
            SqlCommand cmd = new SqlCommand();
            datos.PrepararConsulta(cmd, "SELECT * FROM PROVINCIAS WHERE Id_Provincia = '" + idProvincia + "'");
            try
            {
                SqlDataReader rd = datos.EjecutarLectura(cmd);
                if (rd != null && rd.Read())
                {
                    descProvincia = (string)rd["Descripcion_P"];
                    rd.Close();
                }
            }
            catch (Exception ex) { throw ex; }
            finally { datos.CerrarConexion(cmd.Connection); }
            return descProvincia;
        }
    }
}
