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
        DaoProvincia dao = new DaoProvincia();
        public DataTable getTablaProvincia()
        {
            try
            {
                return dao.getTablaProvincia();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string GetProvincia(string idProvincia)
        {
            try { return dao.GetProvincia(idProvincia); }
            catch (Exception ex) { throw ex; }
        }
    }
}
