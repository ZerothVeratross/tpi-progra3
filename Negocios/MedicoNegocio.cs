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
                SqlDataReader rd = dao.getMedicoUsuario(medico.getUsuario().ToString(), medico.getContrasenia().ToString());
                if (rd.Read() == true)
                {
                    medico.setLegajo((string)rd["Nro_Legajo_M"]);
                    medico.setDni((string)rd["Dni_M"]);
                    medico.setNombre((string)rd["Nombre_M"]);
                    medico.setApellido((string)rd["Apellido_M"]);
                    medico.setSexo((string)rd["Sexo_M"]);
                    medico.setNacionalidad((string)rd["Nacionalidad_M"]);
                    medico.setFechaNacimiento((DateTime)rd["Fecha_Nacimiento_M"]);
                    medico.setDireccion((string)rd["Direccion_M"]);
                    //medico.setLocalidad((Localidad)rd["Id_Localidad_M"]);
                    medico.setCorreoElectronico((string)rd["Correo_Electronico_M"]);
                    medico.setTelefono((string)rd["Telefono_M"]);
                    //medico.setEspecialidad((Especialidad)rd["Id_Especialidad_M"]);
                    medico.setEstado((bool)rd["Estado_M"]);
                    return true;
                }
                else
                {
                    return false;
                }
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
