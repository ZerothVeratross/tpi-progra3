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
            return dao.getTablaEspecialidad();
        }

        public string GetEspecialidad(string idEspecialidad)
        {
            return dao.GetEspecialidad(idEspecialidad);
        }
    }
}
