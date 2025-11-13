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
            DataTable tabla = datos.CrearTabla("PROVINCIAS", "Select * FROM PROVINCIAS");
            return tabla;
        }

        public string GetProvincia(string idProvincia)
        {
            string descProvincia = "";
            SqlCommand cmd = new SqlCommand();
            datos.PrepararConsulta(cmd, "SELECT * FROM PROVINCIAS WHERE Id_Provincia = '" + idProvincia + "'");
            SqlDataReader rd = datos.EjecutarLectura(cmd);
            if (rd != null && rd.Read())
            {
                descProvincia = (string)rd["Descripcion_P"];
            }
            datos.CerrarConexion(cmd.Connection);
            return descProvincia;
        }
    }
}
