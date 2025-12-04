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

        public DataTable GetLocalidades()
        {
            try { return dao.GetLocalidades(); }
            catch (Exception ex) { throw ex; }
        }

        public DataTable GetLocalidadPorProvincia(string idProvincia)
        {
            try { return dao.GetLocalidadPorIdProvincia(idProvincia); }
            catch (Exception ex) { throw ex; }
        }

        public string GetLocalidadPorId(string idLocalidad)
        {
            try { return dao.GetLocalidadPorId(idLocalidad); }
            catch (Exception ex) { throw ex; }
        }

        public DataTable GenerarInforme(string[] localidades)
        {
            try
            {
                DaoLocalidad dao = new DaoLocalidad();
                DataTable dt = dao.TablaInforme(localidades);
                return dt;
            }
            catch (Exception ex) { throw ex; }
        }
    }
}
