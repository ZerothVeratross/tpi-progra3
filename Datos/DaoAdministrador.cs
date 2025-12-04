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

        public bool getAdministradorUsuario(Administrador admin)
        {
            try
            {
                datos.openConexion();
                datos.setearConsulta("Select ID_Administrador, Usuario_A, Contrasenia_A, Nombre_A, Apellido_A From ADMINISTRADORES where Usuario_A = @usuario AND Contrasenia_A = @contra");
                datos.setearParametro("@usuario", admin.getUsuario());
                datos.setearParametro("@contra", admin.getContrasenia());
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    admin.setIdAdmin((string)datos.Lector["ID_Administrador"]);
                    admin.setNombre((string)datos.Lector["Nombre_A"]);
                    admin.setApellido((string)datos.Lector["Apellido_A"]);
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
                datos.closeConexion();
            }
        }
    }
}
