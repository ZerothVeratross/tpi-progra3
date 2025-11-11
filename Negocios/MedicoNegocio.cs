using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

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
            DaoMedico dao = new DaoMedico();
            SqlDataReader rd = dao.getMedico(medico.getUsuario().ToString(), medico.getContrasenia().ToString());
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
