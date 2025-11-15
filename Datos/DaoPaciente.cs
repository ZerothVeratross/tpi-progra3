using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoPaciente
    {
        AccesoDatos datos = new AccesoDatos();
        public DataTable getTablaPacientes()
        {
            DataTable tabla = datos.CrearTabla("PACIENTES", "Select * FROM PACIENTES");
            return tabla;
        }

        public bool ExistePaciente(string dni)
        {
            SqlConnection conexion = null;
            string consultaSQL = "SELECT * FROM PACIENTES WHERE Dni_Paciente = @dni";
            try
            {
                conexion = datos.CrearConexion();
                SqlCommand command = new SqlCommand(consultaSQL, conexion);
                command.Parameters.AddWithValue("@dni", dni);

                bool existe = datos.Existe(command);
                //datos.CerrarConexion(conexion);
                return existe;
            }
            catch (Exception ex)
            {
                //datos.CerrarConexion(conexion);
                throw ex;
            }
            finally
            {
                datos.CerrarConexion(conexion);
            }

        }

        public int AgregarPaciente(Paciente paciente)
        {
            try
            {
                datos.openConexion();

                string consultaSQL = "INSERT INTO PACIENTES (Dni_Paciente, Nombre_P, Apellido_P, Sexo_P, " +
                                    "Fecha_Nacimiento_P, Nacionalidad_P, Id_Localidad_P, Direccion_P, " +
                                    "Correo_Electronico_P, Telefono_P, Estado_P) " +
                                    "VALUES (@dni, @nombre, @apellido, @sexo, @fechaNacimiento, @nacionalidad, " +
                                    "@idLocalidad, @direccion, @correo, @telefono, 1)";

                datos.setearConsulta(consultaSQL);
                datos.setearParametro("@dni", paciente.getDni());
                datos.setearParametro("@nombre", paciente.getNombre());
                datos.setearParametro("@apellido", paciente.getApellido());
                datos.setearParametro("@sexo", paciente.getSexo());
                datos.setearParametro("@fechaNacimiento", paciente.getFechaNacimiento());
                datos.setearParametro("@nacionalidad", paciente.getNacionalidad());
                datos.setearParametro("@idLocalidad", paciente.getLocalidad().getIdLocalidad());
                datos.setearParametro("@direccion", paciente.getDireccion());
                datos.setearParametro("@correo", paciente.getCorreoElectronico());
                datos.setearParametro("@telefono", paciente.getTelefono());

                int filasAfectadas = datos.ejecutarAccion();
                //datos.closeConexion();

                return filasAfectadas;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
        }

    }
}
