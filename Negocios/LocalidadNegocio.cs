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
            try
            {
                return dao.getTablaLocalidad(idProvincia);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string GetLocalidad(string idLocalidad)
        {
            try { return dao.GetLocalidad(idLocalidad); }
            catch (Exception ex) { throw ex; }
        }

        public DataTable GenerarInforme()
        {
            try
            {
                DaoLocalidad dao = new DaoLocalidad();
                DataTable dt = dao.TablaInforme();
                return dt;
            }
            catch (Exception ex) { throw ex; }
        }
    }
}
