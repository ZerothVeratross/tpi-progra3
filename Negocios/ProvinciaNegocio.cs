using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class ProvinciaNegocio
    {
        public DataTable getTablaProvincia()
        {
            DaoProvincia daoProvincia = new DaoProvincia();
            return daoProvincia.getTablaProvincia();
        }
    }
}
