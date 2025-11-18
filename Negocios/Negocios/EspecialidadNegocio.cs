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
    public class EspecialidadNegocio
    {
        private DaoEspecialidad dao = new DaoEspecialidad();
        public DataTable getTablaEspecialidades()
        {
            try
            {
                return dao.getTablaEspecialidad();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public string GetEspecialidad(string idEspecialidad)
        {
            try { return dao.GetEspecialidad(idEspecialidad); }
            catch (Exception ex) { throw ex; }
        }
    }
}
