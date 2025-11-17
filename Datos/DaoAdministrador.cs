using Entidades;
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
            DataTable tabla = datos.CrearTabla("ADMINISTRADORES", "Select * From ADMINISTRADORES");
            return tabla;
        }
        public bool getAdministradorUsuario(Administrador admin)
        {
            SqlCommand command = new SqlCommand();
            SqlDataReader rd = null;
            try
            {
                datos.PrepararConsulta(command, "Select ID_Administrador, Usuario_A, Contrasenia_A, Nombre_A, Apellido_A From ADMINISTRADORES where Usuario_A = @usuario AND Contrasenia_A = @contra");
                datos.PrepararParametro(command, "@usuario", admin.getUsuario());
                datos.PrepararParametro(command, "@contra", admin.getContrasenia());
                rd = datos.EjecutarLectura(command);
                if (rd.Read() == true)
                {
                    admin.setIdAdmin((string)rd["ID_Administrador"]);
                    admin.setNombre((string)rd["Nombre_A"]);
                    admin.setApellido((string)rd["Apellido_A"]);
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion(command.Connection, rd);//agrego el cierre de la conexion junto con el reader.
            }
        }
    }
}
