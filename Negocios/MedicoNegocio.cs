using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Collections.Specialized.BitVector32;

namespace Negocios
{
    public class MedicoNegocio
    {
        DaoMedico dao = new DaoMedico();
        public DataTable ListarMedicos(string legajo, string nombre, string apellido, string dia, string especialidad)
        {
            try
            {
                return dao.getTablaMedicos(legajo, nombre, apellido, dia, especialidad);
            }
            catch (Exception ex)
            {
                throw ex;
            } 
        }

        public bool LoginMedico(Medico medico)
        {
            try
            {
                return dao.getMedicoUsuario(medico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
        public bool VerificarCorreo(string email, Medico medico)
        {
            try
            {
                return dao.VerificarCorreo(email, medico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int EnviarCodigo(string email)
        {
            try
            {
                EmailServicio emailServico = new EmailServicio();
                int codigo = emailServico.enviarCodigo(email);
                emailServico.enviarEmail();
                return codigo;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CambiarContrasenia(string pass, Medico medico)
        {
            try
            {
                return dao.CambiarContrasenia(pass, medico);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        public string GetLegajoNuevo()
        {
            try { return dao.GetLegajoNuevo(); }
            catch (Exception ex) { throw ex; }
        }

        public void agregarMedico(Medico medico)
        {
            try { dao.AgregarMedico(medico); }
            catch (Exception ex) { throw ex; }
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

        public bool BuscarUsuario(string usuario)
        {
            try { return dao.BuscarUsuario(usuario); }
            catch (Exception ex) { throw ex; }
        }

        public bool BuscarDNI(string dni)
        {
            try { return dao.BuscarDNI(dni); }
            catch (Exception ex) { throw ex; }
        }
    }
}
