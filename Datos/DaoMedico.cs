using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    
    public class DaoMedico
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaMedicos()
        {
            DataTable tabla = datos.CrearTabla("Medico", "Select * from Medicos");
            return tabla;
        }

        public SqlDataReader getMedicoUsuario(string usuario, string contrasenia)
        {
            SqlCommand command = new SqlCommand();

            datos.PrepararConsulta(command, "Select Nro_Legajo_M, Dni_M, Nombre_M, Apellido_M, Sexo_M, Nacionalidad_M, Fecha_Nacimiento_M, Direccion_M,Id_Localidad_M, Correo_Electronico_M, Telefono_M, Id_Especialidad_M, Usuario_M, Contrasenia_M, Estado_M From MEDICOS where Usuario_M = @usuario AND Contrasenia_M = @contra");
            datos.PrepararParametro(command, "@usuario", usuario);
            datos.PrepararParametro(command, "@contra", contrasenia);
            SqlDataReader reader = datos.EjecutarLectura(command);
            return reader;

        }
    }
}
