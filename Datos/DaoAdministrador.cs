using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoAdministrador
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaAdministrador()
        {
            DataTable tabla = datos.CrearTabla("ADMINISTRADORES", "Select * FROm ADMINISTRADORES");
            return tabla;
        }
        public SqlDataReader getAdministradorUsuario(string usuario, string contrasenia)
        {
            try
            {
                SqlCommand command = new SqlCommand();

                datos.PrepararConsulta(command, "Select ID_Administrador, Usuario_A, Contrasenia_A From ADMINISTRADORES where Usuario_A = @usuario AND Contrasenia_A = @contra");
                datos.PrepararParametro(command, "@usuario", usuario);
                datos.PrepararParametro(command, "@contra", contrasenia);
                SqlDataReader reader = datos.EjecutarLectura(command);
                return reader;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
