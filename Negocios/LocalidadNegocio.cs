using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class LocalidadNegocio
    {
        DaoLocalidad dao = new DaoLocalidad();

        public DataTable getTablaLocalidad(string idProvincia)
        {
            return dao.getTablaLocalidad(idProvincia);
        }

        public string GetLocalidad(string idLocalidad)
        {
            return dao.GetLocalidad(idLocalidad);
        }
    }
}
