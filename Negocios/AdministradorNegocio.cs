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
        public bool Login(Administrador admin)
        {
                DaoAdministrador dao = new DaoAdministrador();
            try
            {
                return dao.getAdministradorUsuario(admin);
            }
            catch (Exception ex)
            {
                throw ex;
            } 
        }
    }
}
