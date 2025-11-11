using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
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
            return false;
        }

    }
}
