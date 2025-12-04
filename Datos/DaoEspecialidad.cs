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
                datos.openConexion();
                datos.setearAdaptador("Select * FROM ESPECIALIDADES");
                return datos.ejecutarTabla("ESPECIALIDADES");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string GetEspecialidad(string idEspecialidad)
        {
            string descEspecialidad = "";
            try
            {
                datos.openConexion();
                datos.setearConsulta("SELECT * FROM ESPECIALIDADES WHERE ID_Especialidad = @idEspecialidad");
                datos.setearParametro("@idEspecialidad", idEspecialidad);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    descEspecialidad = (string)datos.Lector["Descripcion_E"];
                }
            }
            catch (Exception ex) { throw ex; }
            finally { datos.closeConexion(); }
            return descEspecialidad;
        }
    }
}
