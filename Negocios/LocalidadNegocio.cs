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
        public DataTable getTablaLocalidad(string idProvincia)
        {
            DaoLocalidad doaLocalidad = new DaoLocalidad();
            return doaLocalidad.getTablaLocalidad(idProvincia);
        }
    }
}
