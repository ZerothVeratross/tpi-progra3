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
                datos.openConexion();
                datos.setearAdaptador("Select * FROM PROVINCIAS");
                return datos.ejecutarTabla("PROVINCIAS");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string GetProvincia(string idProvincia)
        {
            string descProvincia = "";
            try
            {
                datos.openConexion();
                datos.setearConsulta("SELECT * FROM PROVINCIAS WHERE Id_Provincia = @idProvincia");
                datos.setearParametro("@idProvincia", idProvincia);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    descProvincia = (string)datos.Lector["Descripcion_P"];
                }
            }
            catch (Exception ex) { throw ex; }
            finally { datos.closeConexion(); }
            return descProvincia;
        }
    }
}
