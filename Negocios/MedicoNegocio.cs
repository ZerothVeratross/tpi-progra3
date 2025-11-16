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
        /*Metodos de baja medico*/
        public DataTable BuscarMedicoTabla(string dni)
        {
            return dao.TraerMedicoTabla(dni);/// capturar excepcion

        }
        public bool BajaLogicaMedico(string dni)
        {
            return dao.BajaMedico(dni);
        }
        /// metodos de modificar medico
        public Medico TraerMedico(Medico medico)
        {
            return dao.BuscarMedico(medico);
        }
        public bool ModificarMedico(Medico medico)
        {
            return dao.ModificarMedicoEnBD(medico);
        }
        public bool ValidarCamposUnicos(Medico medico, out string mensaje)
        {
            mensaje = "";

            if (dao.ExisteDniEnOtroMedico(medico.getDni(), medico.getLegajo()))
            {
                mensaje += "El DNI ya está registrado en otro médico. ";
            }

            if (dao.ExisteCorreoEnOtroMedico(medico.getCorreoElectronico(), medico.getLegajo()))
            {
                mensaje += "El correo electrónico ya está registrado. ";
            }

            if (dao.ExisteTelefonoEnOtroMedico(medico.getTelefono(), medico.getLegajo()))
            {
                mensaje += "El teléfono ya pertenece a otro médico. ";
            }
            if (dao.ExisteUsuario(medico.getUsuario(), medico.getLegajo()))
            {
                mensaje += "El usuario ya existe.";
            }

            return mensaje == "";
        }
    }
}
