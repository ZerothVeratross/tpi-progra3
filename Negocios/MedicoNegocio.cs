using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Negocios
{
    public class MedicoNegocio
    {
        public DataTable getMedicos()
        {
            DaoMedico daoMedico = new DaoMedico();
            return daoMedico.getTablaMedicos();
        }

        public bool LoginMedico(Medico medico)
        {
            return false;
        }
        public void agregarMedico(Medico medico)
        {

        }

        public void modificarMedico(Medico medico)
        {

        }

        public bool eliminarMedico(Medico medico)
        {
            return true;
        }

        public bool reactivarMedico(Medico medico)
        {
            return true;
        }
    }
}
