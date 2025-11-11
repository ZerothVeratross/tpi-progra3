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
        public DataTable getTablaEspecialidades()
        {
            DaoEspecialidad daoEspecialidad = new DaoEspecialidad();
            return daoEspecialidad.getTablaEspecialidad();
        }
    }
}
