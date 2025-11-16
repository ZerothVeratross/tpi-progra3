using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class AdministradorNegocio
    {

        public DataTable getTablaAdministrador()
        {
            DaoAdministrador daoAdministrador = new DaoAdministrador();
            return daoAdministrador.getTablaAdministrador();
        }

        public bool Login(Administrador admin)
        {
            try
            {
                DaoAdministrador dao = new DaoAdministrador();
                SqlDataReader rd = dao.getAdministradorUsuario(admin.getUsuario().ToString(), admin.getContrasenia().ToString());
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
        }

    }
}
