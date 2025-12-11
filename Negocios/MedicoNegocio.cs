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
            try
            {
                return dao.TraerMedicoTabla(dni);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool BajaLogicaMedico(string dni)
        {
            try
            {
                return dao.BajaMedico(dni);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// metodos de modificar medico
        public Medico TraerMedico(Medico medico)
        {
            try
            {
                return dao.BuscarMedico(medico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ModificarMedico(Medico medico)
        {
            try
            {
                return dao.ModificarMedicoEnBD(medico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ValidarCamposUnicos(Medico medico, out string mensaje)
        {
            try
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
                // Validamos —Si el DNI también existe en PACIENTES
                PacienteNegocio pacienteNeg = new PacienteNegocio();
                Paciente paciente = pacienteNeg.BuscarPacientePorDNI(medico.getDni());

                if (paciente != null)
                {
                    mensaje += "El DNI ingresado existe en PACIENTES.";
                }
                return mensaje == "";
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //Reactivar Medico
        public DataTable TablaMedicosInactivos()
        {
            try
            {
                return dao.GetTablaInactivos();
            }
            catch (Exception ex) { throw ex; }
        }

        public DataTable TablaMedicosInactivosBuscar(string buscar)
        {
            try
            {
                return dao.GetTablaInactivosFiltrar(buscar);
            }
            catch (Exception ex) { throw ex; }
        }

        public bool ReactivarMedico(string legajo)
        {
            try
            {
                DaoMedico daoMedico = new DaoMedico();
                return daoMedico.ReactivarMedico(legajo);
            }
            catch (Exception ex) { throw ex; }
        }
    }
}
